# Profile helper for compile.sh — POSIX awk, no interpreter dependency.
#
# Scrapes every toggleable id straight out of the module sources, so a newly
# added skill/project/cert is picked up automatically — there is no registry to
# maintain. Cross-checks those ids against the `hide` lists in metadata.toml and
# reports typos, because an id matching nothing fails SILENTLY and you end up
# sending a CV that still contains what you meant to cut.
#
# Usage (metadata.toml must be listed first):
#   awk -v mode=names -f profiles.awk metadata.toml
#   awk -v mode=list  -f profiles.awk metadata.toml modules_en/*.typ
#   awk -v mode=check -v target=college -f profiles.awk metadata.toml modules_en/*.typ

function trim(s) {
    gsub(/^[ \t]+|[ \t]+$/, "", s)
    return s
}

# Pull the quoted strings out of a `hide = [...]` fragment.
function collect_hidden(frag,   rest, q1, q2, id) {
    rest = frag
    while (match(rest, /"[^"]*"/)) {
        id = substr(rest, RSTART + 1, RLENGTH - 2)
        rest = substr(rest, RSTART + RLENGTH)
        if (id != "") hidden[cur_profile, id] = 1
    }
}

# Text inside the first [...] on a line, cleaned of Typst markup. Some fields
# wrap onto a second line (e.g. society: [BLE-Based Embedded Car System\n(2
# Months)]), so fall back to "everything after the [" when there is no closer.
function bracket_text(line,   s) {
    if (match(line, /\[[^\]]*\]/))
        s = substr(line, RSTART + 1, RLENGTH - 2)
    else if (match(line, /\[[^\]]*$/))
        s = substr(line, RSTART + 1)
    else
        return ""
    gsub(/#h-bar\(\)|#linebreak\(\)|\*/, " ", s)
    gsub(/[ \t]+/, " ", s)
    return trim(s)
}

function label_for(id, mod,   order, i, n, f) {
    # 'title' is a generic role in projects/professional, so prefer 'society'.
    if (mod == "professional" || mod == "projects") order = "society title"
    else if (mod == "education")                    order = "title society"
    else if (mod == "skills")                       order = "type"
    else                                            order = "title issuer"
    n = split(order, f, " ")
    for (i = 1; i <= n; i++)
        if ((id, f[i]) in field) return field[id, f[i]]
    return ""
}

BEGIN { FS = "\n" }

# ── metadata.toml ────────────────────────────────────────────────────────────
FILENAME ~ /metadata\.toml$/ {
    if ($0 ~ /^\[profiles\.[^]]+\]/) {
        cur_profile = $0
        sub(/^\[profiles\./, "", cur_profile)
        sub(/\].*$/, "", cur_profile)
        porder[++pcount] = cur_profile
        in_hide = 0
        next
    }
    if ($0 ~ /^\[/) { cur_profile = ""; in_hide = 0; next }   # any other table
    if (cur_profile == "") next

    if (in_hide) {                       # continuation of a multi-line list
        collect_hidden($0)
        if ($0 ~ /\]/) in_hide = 0
        next
    }
    if ($0 ~ /^[ \t]*hide[ \t]*=/) {
        collect_hidden($0)
        if ($0 !~ /\]/) in_hide = 1      # list spills onto following lines
    }
    next
}

# ── module sources ───────────────────────────────────────────────────────────
{
    mod = FILENAME
    sub(/.*\//, "", mod)
    sub(/\.typ$/, "", mod)

    line = $0
    # `on("x")`, but not the "on(" inside cv-secti-on(
    while (match(line, /(^|[^A-Za-z])on\("[^"]*"/)) {
        seg = substr(line, RSTART, RLENGTH)
        sub(/^[^(]*\("/, "", seg)
        sub(/"$/, "", seg)
        if (!(seg in seen)) {
            seen[seg] = 1
            iorder[++icount] = seg
            imod[seg] = mod
            if (!(mod in modseen)) { modseen[mod] = 1; morder[++mcount] = mod }
        }
        pending = seg
        line = substr(line, RSTART + RLENGTH)
    }

    # Capture naming fields that follow, until the next entry starts.
    if (pending != "") {
        # Only record a field when text was actually extracted, otherwise an
        # empty string would win over a later, usable field.
        for (k = 1; k <= 4; k++) {
            fn = (k == 1 ? "society" : k == 2 ? "title" : k == 3 ? "type" : "issuer")
            # Regex built from a string, so the bracket needs double escaping.
            if ($0 ~ fn ":[ \t]*\\[" && !((pending, fn) in field)) {
                v = bracket_text($0)
                if (v != "") field[pending, fn] = v
            }
        }
    }
}

END {
    if (mode == "names") {
        for (i = 1; i <= pcount; i++) print porder[i]
        exit 0
    }

    if (mode == "check") {
        found = 0
        for (i = 1; i <= pcount; i++) if (porder[i] == target) found = 1
        if (!found) {
            printf "[X] Unknown profile '%s'\n    Available:", target
            for (i = 1; i <= pcount; i++) printf " %s", porder[i]
            printf "\n"
            exit 1
        }
        bad = 0
        for (k in hidden) {
            split(k, parts, SUBSEP)
            if (!(parts[2] in seen)) {
                printf "[X] Profile [%s] hides \"%s\", but no entry uses that id.\n",
                       parts[1], parts[2]
                bad = 1
            }
        }
        if (bad) {
            printf "\n    Run ./compile.sh --list to see all valid ids.\n"
            exit 1
        }
        exit 0
    }

    # ── list ────────────────────────────────────────────────────────────────
    iw = 2; lw = 5
    for (j = 1; j <= icount; j++) {
        id = iorder[j]
        lab[id] = label_for(id, imod[id])
        if (length(id) + 2 > iw) iw = length(id) + 2
        if (length(lab[id]) + 2 > lw) lw = length(lab[id]) + 2
    }
    if (lw > 48) lw = 48

    printf "\n  Every toggleable id. 'hidden' = cut from that profile.\n\n"
    printf "  %-*s%-*s", iw, "ID", lw, "ENTRY"
    for (i = 1; i <= pcount; i++) printf "%-10s", porder[i]
    printf "\n  "
    n = iw + lw + 10 * pcount
    for (i = 0; i < n; i++) printf "-"
    printf "\n"

    for (m = 1; m <= mcount; m++) {
        printf "\n  %s\n", morder[m]
        for (j = 1; j <= icount; j++) {
            id = iorder[j]
            if (imod[id] != morder[m]) continue
            t = lab[id]
            if (length(t) > lw - 2) t = substr(t, 1, lw - 3) "~"
            printf "  %-*s%-*s", iw, id, lw, t
            for (i = 1; i <= pcount; i++)
                printf "%-10s", ((porder[i], id) in hidden) ? "hidden" : "shown"
            printf "\n"
        }
    }
    printf "\n  Edit the 'hide' lists near the top of template/metadata.toml.\n\n"
}
