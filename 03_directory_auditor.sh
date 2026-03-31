#!/bin/bash
# ============================================================
# Script 3: Directory Auditor
# Course: Open Source Software (Python Audit)
# Description: Uses a for loop to check sizes and
#              read/write permissions of key directories
# ============================================================

echo "=============================================="
echo "            DIRECTORY AUDITOR                "
echo "=============================================="
echo ""

# List of directories to audit
directories=("/etc" "/var/log" "/usr/bin" "/etc/python3")

printf "%-20s %-15s %-10s %-10s %-15s\n" "Directory" "Size" "Readable" "Writable" "Permissions"
echo "----------------------------------------------------------------------"

for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        # Get size using du (summarize, human-readable)
        size=$(du -sh "$dir" 2>/dev/null | cut -f1)

        # Check read permission
        if [ -r "$dir" ]; then
            readable="YES ✔"
        else
            readable="NO  ✘"
        fi

        # Check write permission
        if [ -w "$dir" ]; then
            writable="YES ✔"
        else
            writable="NO  ✘"
        fi

        # Get raw permissions string
        perms=$(stat -c "%A" "$dir" 2>/dev/null)

        printf "%-20s %-15s %-10s %-10s %-15s\n" "$dir" "$size" "$readable" "$writable" "$perms"
    else
        printf "%-20s %-15s %-10s %-10s %-15s\n" "$dir" "N/A" "N/A" "N/A" "DOES NOT EXIST"
    fi
done

echo ""
echo "--- Detailed Permission Breakdown ---"
echo ""

for dir in "${directories[@]}"; do
    echo "Directory: $dir"
    if [ -d "$dir" ]; then
        echo "  Exists       : Yes"
        echo "  Size         : $(du -sh "$dir" 2>/dev/null | cut -f1)"
        echo "  Permissions  : $(stat -c "%A" "$dir")"
        echo "  Owner        : $(stat -c "%U" "$dir")"
        echo "  Group        : $(stat -c "%G" "$dir")"
        echo "  Readable     : $([ -r "$dir" ] && echo 'Yes' || echo 'No')"
        echo "  Writable     : $([ -w "$dir" ] && echo 'Yes' || echo 'No')"
        echo "  Executable   : $([ -x "$dir" ] && echo 'Yes' || echo 'No')"
    else
        echo "  Exists       : No (directory not found on this system)"
    fi
    echo ""
done

echo "=============================================="
echo "         END OF DIRECTORY AUDITOR            "
echo "=============================================="
