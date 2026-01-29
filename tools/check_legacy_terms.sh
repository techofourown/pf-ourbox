#!/bin/bash
# check_legacy_terms.sh
# Enforces that no legacy OurBox naming appears in the codebase

set -e

LEGACY_TERMS=(
    "OurBox Mini"
    "OurBox Desk"
    "hw-ourbox-mini"
    "hw-ourbox-desk-32"
    "img-ourbox-mini-rpi"
    "TOO-OBX-MINI-"
    "TOO-OBX-DESK-"
)

LEGACY_PREFIXES=(
    "CFG"
    "SKU"
)

FOUND_LEGACY=0

echo "Checking for legacy terms..."

for term in "${LEGACY_TERMS[@]}"; do
    if rg --quiet --glob='!tools/check_legacy_terms.sh' "$term" .; then
        echo "ERROR: Found legacy term: $term"
        rg --color=always -n --glob='!tools/check_legacy_terms.sh' "$term" .
        FOUND_LEGACY=1
    fi
done

for prefix in "${LEGACY_PREFIXES[@]}"; do
    term="${prefix}-"
    if rg --quiet --glob='!tools/check_legacy_terms.sh' "$term" .; then
        echo "ERROR: Found legacy identifier prefix: ${prefix}"
        rg --color=always -n --glob='!tools/check_legacy_terms.sh' "$term" .
        FOUND_LEGACY=1
    fi
done

if [ $FOUND_LEGACY -eq 1 ]; then
    echo ""
    echo "❌ Legacy terms found! Please update to use:"
    echo "  - 'OurBox Matchbox' instead of 'OurBox Mini'"
    echo "  - 'OurBox Tinderbox' instead of 'OurBox Desk'"
    echo "  - 'TOO-OBX-MBX-' instead of 'TOO-OBX-MINI-'"
    echo "  - 'TOO-OBX-TBX-' instead of 'TOO-OBX-DESK-'"
    echo "  - 'TOO-' prefixed SKU part numbers for all buildable hardware identifiers"
    exit 1
fi

echo "✓ No legacy terms found"
exit 0
