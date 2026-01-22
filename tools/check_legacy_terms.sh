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

FOUND_LEGACY=0

echo "Checking for legacy terms..."

for term in "${LEGACY_TERMS[@]}"; do
    if rg --quiet "$term" .; then
        echo "ERROR: Found legacy term: $term"
        rg --color=always -n "$term" .
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
    exit 1
fi

echo "✓ No legacy terms found"
exit 0
