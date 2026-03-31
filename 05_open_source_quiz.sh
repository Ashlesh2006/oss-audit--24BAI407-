#!/bin/bash
# ============================================================
# Script 5: Interactive Open Source Quiz
# Course: Open Source Software (Python Audit)
# Description: Asks the user 3 questions about open source
#              and saves their answers to a text file
# ============================================================

echo "=============================================="
echo "      INTERACTIVE OPEN SOURCE QUIZ           "
echo "=============================================="
echo ""
echo "Welcome! Please answer the following 3 questions"
echo "about Open Source Software. Your answers will be"
echo "saved to a file for review."
echo ""

# Define output file with timestamp
OUTPUT_DIR="$(dirname "$0")"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="$OUTPUT_DIR/open_source_answers_$TIMESTAMP.txt"

# Write header to file
{
    echo "=============================================="
    echo "     OPEN SOURCE SOFTWARE - QUIZ ANSWERS     "
    echo "=============================================="
    echo "Date & Time : $(date '+%A, %d %B %Y at %H:%M:%S')"
    echo "Recorded by : $(whoami)"
    echo "Hostname    : $(hostname)"
    echo "=============================================="
    echo ""
} > "$OUTPUT_FILE"

# ----------------------------
# Question 1
# ----------------------------
echo "Question 1:"
echo "  What is Open Source Software, and how does it differ"
echo "  from proprietary (closed-source) software?"
echo ""
echo -n "Your Answer: "
read -r answer1

echo ""

# ----------------------------
# Question 2
# ----------------------------
echo "Question 2:"
echo "  Name at least TWO popular open-source licenses"
echo "  (e.g., MIT, GPL) and briefly explain what each allows."
echo ""
echo -n "Your Answer: "
read -r answer2

echo ""

# ----------------------------
# Question 3
# ----------------------------
echo "Question 3:"
echo "  Why is Python considered a major open-source language,"
echo "  and how has its open-source nature contributed to its"
echo "  widespread adoption in academia and industry?"
echo ""
echo -n "Your Answer: "
read -r answer3

echo ""

# ----------------------------
# Save answers to file
# ----------------------------
{
    echo "Question 1:"
    echo "  What is Open Source Software, and how does it differ from proprietary software?"
    echo ""
    echo "Answer:"
    echo "  $answer1"
    echo ""
    echo "----------------------------------------------"
    echo ""
    echo "Question 2:"
    echo "  Name at least TWO popular open-source licenses and briefly explain each."
    echo ""
    echo "Answer:"
    echo "  $answer2"
    echo ""
    echo "----------------------------------------------"
    echo ""
    echo "Question 3:"
    echo "  Why is Python considered a major open-source language?"
    echo ""
    echo "Answer:"
    echo "  $answer3"
    echo ""
    echo "=============================================="
    echo "              END OF ANSWERS                 "
    echo "=============================================="
} >> "$OUTPUT_FILE"

echo "=============================================="
echo "  ✔ Your answers have been saved!"
echo ""
echo "  Output file: $OUTPUT_FILE"
echo "=============================================="
echo ""
echo "Thank you for completing the Open Source Quiz!"
