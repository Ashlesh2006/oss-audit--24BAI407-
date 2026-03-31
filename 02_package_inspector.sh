#!/bin/bash
# ============================================================
# Script 2: Package Inspector
# Course: Open Source Software (Python Audit)
# Description: Uses dpkg to check if Python3 is installed
#              and prints its version details
# ============================================================

echo "=============================================="
echo "           PACKAGE INSPECTOR                 "
echo "=============================================="
echo ""

PACKAGE="python3"

echo "Checking installation status of: $PACKAGE"
echo "----------------------------------------------"

# Check if python3 is installed using dpkg
dpkg_status=$(dpkg -l "$PACKAGE" 2>/dev/null | grep "^ii")

if [ -n "$dpkg_status" ]; then
    echo "Status        : INSTALLED ✔"
    echo ""

    # Extract version from dpkg output
    installed_version=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{print $3}')
    echo "dpkg Version  : $installed_version"

    # Also get the runtime version directly
    if command -v python3 &>/dev/null; then
        runtime_version=$(python3 --version 2>&1)
        echo "Runtime Check : $runtime_version"
        echo "Binary Path   : $(which python3)"
    fi

    echo ""
    echo "--- Full dpkg Entry ---"
    dpkg -l "$PACKAGE" | grep "^ii"

    echo ""
    echo "--- Package Details ---"
    dpkg -s "$PACKAGE" 2>/dev/null | grep -E "^(Package|Version|Architecture|Maintainer|Description|Status)"

else
    echo "Status        : NOT INSTALLED ✘"
    echo ""
    echo "Python3 does not appear to be installed on this system."
    echo "To install it, run:"
    echo "    sudo apt update && sudo apt install python3"
fi

echo ""
echo "=============================================="
echo "         END OF PACKAGE INSPECTOR            "
echo "=============================================="
