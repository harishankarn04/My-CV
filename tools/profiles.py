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


def ids_by_module():
    out = {}
    for f in sorted(MODULES.glob("*.typ")):
        found = []
        for m in ID_RE.finditer(f.read_text()):
            if m.group(1) not in found:
                found.append(m.group(1))
        if found:
            out[f.stem] = found
    return out


def all_ids():
    return {i for v in ids_by_module().values() for i in v}


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
    width = max((len(i) for v in mods.values() for i in v), default=10) + 2

    print()
    print("  Every toggleable id. 'hidden' = cut from that profile.")
    print()
    print("  " + "ID".ljust(width) + "".join(n.ljust(10) for n in names))
    print("  " + "-" * (width + 10 * len(names)))
    for mod, ids in mods.items():
        print()
        print(f"  {mod}")
        for i in ids:
            row = "  " + i.ljust(width)
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
