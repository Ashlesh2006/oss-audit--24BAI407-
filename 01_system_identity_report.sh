#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Course: Open Source Software (Python Audit)
# Description: Displays distro, kernel, user, uptime, and OS license
# ============================================================

echo "=============================================="
echo "         SYSTEM IDENTITY REPORT              "
echo "=============================================="
echo ""

# Distribution info
echo "--- Distribution ---"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "Distro Name   : $NAME"
    echo "Distro Version: $VERSION"
    echo "Pretty Name   : $PRETTY_NAME"
else
    echo "Distro info   : /etc/os-release not found"
fi

echo ""

# Kernel info
echo "--- Kernel ---"
echo "Kernel Version: $(uname -r)"
echo "Kernel Name   : $(uname -s)"
echo "Architecture  : $(uname -m)"

echo ""

# Current user
echo "--- User ---"
echo "Current User  : $(whoami)"
echo "Home Directory: $HOME"
echo "Shell         : $SHELL"

echo ""

# Uptime
echo "--- Uptime ---"
echo "System Uptime : $(uptime -p)"
echo "Boot Time     : $(who -b | awk '{print $3, $4}')"

echo ""

# OS License
echo "--- OS License ---"
if [ -f /usr/share/doc/ubuntu-minimal/copyright ]; then
    echo "License File  : /usr/share/doc/ubuntu-minimal/copyright"
    echo "License Type  : Ubuntu is distributed under various open-source licenses."
    echo "                The Linux kernel is licensed under the GNU GPL v2."
    echo "                Ubuntu itself is governed by Canonical's terms and open-source licenses."
elif [ -f /etc/os-release ]; then
    echo "License Info  : This system runs an open-source OS."
    echo "                Refer to /usr/share/common-licenses/ for full license texts."
    ls /usr/share/common-licenses/ 2>/dev/null && echo "Available licenses listed above." || echo "License directory not accessible."
else
    echo "License Info  : Unable to determine license details on this system."
fi

echo ""
echo "=============================================="
echo "          END OF SYSTEM IDENTITY REPORT       "
echo "=============================================="
