#!/usr/bin/env python3
"""
Profile helper for compile.sh.

Scrapes every toggleable id straight out of template/modules_en/*.typ, so a
newly added skill/project/cert is picked up automatically — there is no
registry to maintain. Cross-checks those ids against the `hide` lists in
metadata.toml and reports typos, because an id that matches nothing fails
silently and you end up mailing a CV that still contains what you meant to cut.

    tools/profiles.py list        printable id/profile grid
    tools/profiles.py names       one profile name per line
    tools/profiles.py check NAME  exit 1 (with explanation) on any bad id
"""
import re
import sys
import pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
MODULES = ROOT / "template" / "modules_en"
META = ROOT / "template" / "metadata.toml"

# `on("x")` / `opt("x", ...)`, but NOT the "on(" hiding inside cv-secti-on(
ID_RE = re.compile(r'(?:^|[^A-Za-z])(?:on|opt)\("([^"]+)"')


# Which field names an entry best, per module. In projects/professional the
# 'title' is a generic role ("Embedded Systems Intern"), so 'society' — the
# company or project name — is the useful label. Elsewhere 'title' is the name.
FIELD_ORDER = {
    "professional": ("society", "title"),
    "projects": ("society", "title"),
    "education": ("title", "society"),
    "certificates": ("title", "issuer"),
    "skills": ("type",),
}


def _label(text, pos, module):
    """Human-readable name of the entry an id belongs to.

    An id like 'cert-isro' means nothing on its own, so we pull the entry's own
    naming field out of the source and show it alongside.
    """
    window = text[pos : pos + 700]
    # Stop at the next entry so we never borrow the following one's title.
    nxt = re.search(r"\n\s*(?://\s*id:|#if on\()", window)
    if nxt:
        window = window[: nxt.start()]

    for field in FIELD_ORDER.get(module, ("title", "society", "type")):
        m = re.search(re.escape(field) + r":\s*\[([^\]]*)\]", window)
        if m:
            s = re.sub(r"#h-bar\(\)|\*|#linebreak\(\)", " ", m.group(1))
            s = " ".join(s.split())
            if s:
                return s[:44] + ("…" if len(s) > 44 else "")
    return ""


def ids_by_module():
    out = {}
    for f in sorted(MODULES.glob("*.typ")):
        txt = f.read_text()
        found = []
        seen = set()
        for m in ID_RE.finditer(txt):
            i = m.group(1)
            if i in seen:
                continue
            seen.add(i)
            if i.endswith("-desc"):
                # A sub-toggle for the bullet list inside its parent entry.
                label = "↳ description bullets"
            else:
                label = _label(txt, m.end(), f.stem)
            found.append((i, label))
        if found:
            out[f.stem] = found
    return out


def all_ids():
    return {i for v in ids_by_module().values() for i, _ in v}


def profiles():
    txt = META.read_text()
    out = {}
    # Body runs to the next line-initial [table] header. Must not stop at the
    # first '[', since that is the opening bracket of `hide = [...]`.
    for m in re.finditer(
        r"^\[profiles\.([^\]]+)\]\s*\n((?:(?!^\[)[^\n]*\n?)*)", txt, re.M
    ):
        h = re.search(r"hide\s*=\s*\[(.*?)\]", m.group(2), re.S)
        out[m.group(1)] = re.findall(r'"([^"]*)"', h.group(1)) if h else []
    return out


def cmd_list():
    profs = profiles()
    names = sorted(profs)
    mods = ids_by_module()
    width = max((len(i) for v in mods.values() for i, _ in v), default=10) + 2
    lwidth = max((len(l) for v in mods.values() for _, l in v), default=10) + 2

    print()
    print("  Every toggleable id. 'hidden' = cut from that profile.")
    print()
    print(
        "  "
        + "ID".ljust(width)
        + "ENTRY".ljust(lwidth)
        + "".join(n.ljust(10) for n in names)
    )
    print("  " + "-" * (width + lwidth + 10 * len(names)))
    for mod, ids in mods.items():
        print()
        print(f"  {mod}")
        for i, label in ids:
            row = "  " + i.ljust(width) + label.ljust(lwidth)
            for n in names:
                row += ("hidden" if i in profs[n] else "shown").ljust(10)
            print(row)
    print()
    print(f"  Edit the 'hide' lists at the bottom of {META.relative_to(ROOT)}.")
    print()


def cmd_check(target):
    profs = profiles()
    if target not in profs:
        print(f"[X] Unknown profile '{target}'")
        print(f"    Available: {', '.join(sorted(profs))}")
        return 1
    known = all_ids()
    bad = False
    for name, hidden in profs.items():
        for i in hidden:
            if i not in known:
                print(f'[X] Profile [{name}] hides "{i}", but no entry uses that id.')
                near = [k for k in sorted(known) if k[:4].lower() == i[:4].lower()]
                if near:
                    print(f"    Did you mean: {', '.join(near[:3])}")
                bad = True
    if bad:
        print()
        print("    Run ./compile.sh --list to see all valid ids.")
        return 1
    return 0


if __name__ == "__main__":
    cmd = sys.argv[1] if len(sys.argv) > 1 else "list"
    if cmd == "list":
        cmd_list()
    elif cmd == "names":
        print("\n".join(sorted(profiles())))
    elif cmd == "check":
        sys.exit(cmd_check(sys.argv[2]))
    else:
        print(__doc__)
        sys.exit(1)
