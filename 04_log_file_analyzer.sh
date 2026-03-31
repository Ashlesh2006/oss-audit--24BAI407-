#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Course: Open Source Software (Python Audit)
# Description: Uses a while loop to parse /var/log/dpkg.log
#              for the word 'install' and prints last 5 matches
# ============================================================

echo "=============================================="
echo "           LOG FILE ANALYZER                 "
echo "=============================================="
echo ""

LOG_FILE="/var/log/dpkg.log"
SEARCH_TERM="install"
MAX_RESULTS=5
count=0
matches=()

echo "Log File      : $LOG_FILE"
echo "Search Term   : '$SEARCH_TERM'"
echo "Results Limit : Last $MAX_RESULTS matches"
echo ""

# Check if log file exists and is readable
if [ ! -f "$LOG_FILE" ]; then
    echo "ERROR: Log file '$LOG_FILE' not found."
    echo "This may be a fresh system or WSL environment without dpkg history."
    echo ""
    echo "Tip: Try running 'sudo apt install hello' to generate log entries,"
    echo "     then re-run this script."
    exit 1
fi

if [ ! -r "$LOG_FILE" ]; then
    echo "ERROR: Cannot read '$LOG_FILE'. Try running with sudo."
    exit 1
fi

echo "Scanning log file..."
echo "----------------------------------------------"

# Use a while loop to read the log file line by line
while IFS= read -r line; do
    # Check if the line contains the search term (case-insensitive)
    if echo "$line" | grep -qi "$SEARCH_TERM"; then
        matches+=("$line")
    fi
done < "$LOG_FILE"

total_matches=${#matches[@]}
echo "Total matches found: $total_matches"
echo ""

if [ "$total_matches" -eq 0 ]; then
    echo "No lines containing '$SEARCH_TERM' were found in $LOG_FILE."
else
    echo "--- Last $MAX_RESULTS Matching Lines ---"
    echo ""

    # Calculate the starting index to get the last MAX_RESULTS entries
    start_index=$(( total_matches - MAX_RESULTS ))
    if [ "$start_index" -lt 0 ]; then
        start_index=0
    fi

    # Print the last MAX_RESULTS matches using a while loop with counter
    index=$start_index
    result_count=1
    while [ "$index" -lt "$total_matches" ]; do
        echo "  [$result_count] ${matches[$index]}"
        index=$(( index + 1 ))
        result_count=$(( result_count + 1 ))
    done
fi

echo ""
echo "=============================================="
echo "        END OF LOG FILE ANALYZER             "
echo "=============================================="
