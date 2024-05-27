#!/bin/bash

# Check if a file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

file="$1"

# Count characters, words, and sentences
char_count=$(wc -m < "$file")
word_count=$(wc -w < "$file")
sentence_count=$(grep -o '[.!?]' "$file" | wc -l)

# Handle the case where there might be no sentences
if [ $sentence_count -eq 0 ]; then
    sentence_count=1
fi

# Calculate the ARI
ari=$(echo "scale=2; 4.71 * ($char_count / $word_count) + 0.5 * ($word_count / $sentence_count) - 21.43" | bc)

# Output the results
echo "Characters: $char_count"
echo "Words: $word_count"
echo "Sentences: $sentence_count"
echo "Automated Readability Index: $ari"

# Determine the grade level based on the ARI score
if (( $(echo "$ari < 1" | bc -l) )); then
    echo "Grade Level: Kindergarten (5-6 years old)"
elif (( $(echo "$ari < 2" | bc -l) )); then
    echo "Grade Level: First Grade (6-7 years old)"
elif (( $(echo "$ari < 3" | bc -l) )); then
    echo "Grade Level: Second Grade (7-8 years old)"
elif (( $(echo "$ari < 4" | bc -l) )); then
    echo "Grade Level: Third Grade (8-9 years old)"
elif (( $(echo "$ari < 5" | bc -l) )); then
    echo "Grade Level: Fourth Grade (9-10 years old)"
elif (( $(echo "$ari < 6" | bc -l) )); then
    echo "Grade Level: Fifth Grade (10-11 years old)"
elif (( $(echo "$ari < 7" | bc -l) )); then
    echo "Grade Level: Sixth Grade (11-12 years old)"
elif (( $(echo "$ari < 8" | bc -l) )); then
    echo "Grade Level: Seventh Grade (12-13 years old)"
elif (( $(echo "$ari < 9" | bc -l) )); then
    echo "Grade Level: Eighth Grade (13-14 years old)"
elif (( $(echo "$ari < 10" | bc -l) )); then
    echo "Grade Level: Ninth Grade (14-15 years old)"
elif (( $(echo "$ari < 11" | bc -l) )); then
    echo "Grade Level: Tenth Grade (15-16 years old)"
elif (( $(echo "$ari < 12" | bc -l) )); then
    echo "Grade Level: Eleventh Grade (16-17 years old)"
elif (( $(echo "$ari < 13" | bc -l) )); then
    echo "Grade Level: Twelfth Grade (17-18 years old)"
else
    echo "Grade Level: College (18-22 years old)"
fi
