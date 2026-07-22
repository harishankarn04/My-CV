#!/bin/bash
# Build the CV, optionally as a tailored profile.
#
# Entries in modules_en/ are VISIBLE BY DEFAULT. A profile only lists what it
# HIDES, in the [profiles.*] section near the top of template/metadata.toml.
# Adding a new skill/project/cert therefore needs no config change at all.
#
#   ./compile.sh              full CV
#   ./compile.sh college      a named profile
#   ./compile.sh --list       every id, and which profiles hide it
#   ./compile.sh -d           also build docs

set -u
cd "$(dirname "$0")"
mkdir -p build

HELPER="tools/profiles.awk"
META="template/metadata.toml"
MODULES="template/modules_en"

# awk keeps this dependency-free: no python, no jq, no extra installs.
helper() { mode="$1"; shift; awk -v mode="$mode" "$@" -f "$HELPER" $META $MODULES/*.typ; }

case "${1:-}" in
    --list|-l)
        helper list
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
        echo "Available profiles: $(helper names | tr '\n' ' ')"
        exit 0
        ;;
esac

PROFILE="full"
if [ "${1:-}" != "" ] && [ "${1:-}" != "-d" ]; then PROFILE="$1"; shift; fi

# Refuse to build on an unknown profile name or a hide-list id that matches no
# entry — both mean the PDF would quietly differ from what you intended.
helper check -v target="$PROFILE" || exit 1

if [ "$PROFILE" = "full" ]; then
    OUT="build/Hari_Shankar_N.pdf"
else
    OUT="build/Hari_Shankar_N_${PROFILE}.pdf"
fi

typst compile --root . --font-path template/fonts \
    --input profile="$PROFILE" template/cv.typ "$OUT" || {
        echo "❌ CV compilation failed"; exit 1; }

# Page count straight out of the PDF page tree — cosmetic, so a miss is harmless.
PAGES=$(LC_ALL=C grep -ao '/Count [0-9][0-9]*' "$OUT" | head -1 | awk '{print $2}')
[ -z "$PAGES" ] && PAGES="?"
echo "✅ [$PROFILE] CV -> $OUT  ($PAGES page(s))"

typst compile --root . --font-path template/fonts \
    --input profile="$PROFILE" template/letter.typ build/Hari_Shankar_N_letter.pdf \
    && echo "✅ Letter -> build/Hari_Shankar_N_letter.pdf" \
    || echo "❌ Letter compilation failed"

if [ "${1:-}" = "-d" ]; then
    typst compile --root . docs/docs.typ build/docs.pdf --font-path template/fonts \
        && echo "✅ Docs -> build/docs.pdf" || echo "❌ Docs compilation failed"
fi
