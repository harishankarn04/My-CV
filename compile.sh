#!/bin/bash
# Build the CV, optionally as a tailored profile.
#
# Entries in modules_en/ are VISIBLE BY DEFAULT. A profile only lists what it
# HIDES, in the [profiles.*] section at the bottom of template/metadata.toml.
# Adding a new skill/project/cert therefore needs no config change at all.
#
#   ./compile.sh              full CV
#   ./compile.sh college      a named profile
#   ./compile.sh --list       every id, and which profiles hide it
#   ./compile.sh -d           also build docs

set -u
cd "$(dirname "$0")"
mkdir -p build

HELPER="tools/profiles.py"

case "${1:-}" in
    --list|-l)
        python3 "$HELPER" list
        exit 0
        ;;
    -h|--help)
        echo "Usage: ./compile.sh [profile] [-d]"
        echo ""
        echo "  ./compile.sh              build the full CV"
        echo "  ./compile.sh college      build a named profile"
        echo "  ./compile.sh --list       show every id and per-profile visibility"
        echo "  ./compile.sh -d           also build the docs"
        echo ""
        echo "Available profiles: $(python3 "$HELPER" names | tr '\n' ' ')"
        exit 0
        ;;
esac

PROFILE="full"
if [ "${1:-}" != "" ] && [ "${1:-}" != "-d" ]; then PROFILE="$1"; shift; fi

# Refuse to build on an unknown profile name or a hide-list id that matches no
# entry — both mean the PDF would quietly differ from what you intended.
python3 "$HELPER" check "$PROFILE" || exit 1

if [ "$PROFILE" = "full" ]; then
    OUT="build/Hari_Shankar_N.pdf"
else
    OUT="build/Hari_Shankar_N_${PROFILE}.pdf"
fi

typst compile --root . --font-path template/fonts \
    --input profile="$PROFILE" template/cv.typ "$OUT" || {
        echo "❌ CV compilation failed"; exit 1; }

PAGES=$(python3 -c "
import re
print(len(re.findall(rb'/Type\s*/Page[^s]', open('$OUT','rb').read())))" 2>/dev/null || echo "?")
echo "✅ [$PROFILE] CV -> $OUT  ($PAGES page(s))"

typst compile --root . --font-path template/fonts \
    --input profile="$PROFILE" template/letter.typ build/Hari_Shankar_N_letter.pdf \
    && echo "✅ Letter -> build/Hari_Shankar_N_letter.pdf" \
    || echo "❌ Letter compilation failed"

if [ "${1:-}" = "-d" ]; then
    typst compile --root . docs/docs.typ build/docs.pdf --font-path template/fonts \
        && echo "✅ Docs -> build/docs.pdf" || echo "❌ Docs compilation failed"
fi
