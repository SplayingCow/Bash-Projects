#!/bin/bash
# Log File Analyzer Script
# Parses system logs for failed login attempts and outputs a summary.

# Define the log file to analyze
LOG_FILE="/var/log/auth.log"  # Change to /var/log/secure for Red Hat-based systems
SUMMARY_FILE="failed_login_summary.txt"

# Check if the log file exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Log file $LOG_FILE not found. Please check the log file path."
    exit 1
fi

# Analyze the log file
echo "Analyzing log file: $LOG_FILE"
echo "Summary of failed login attempts:" > "$SUMMARY_FILE"

# Extract failed login attempts and summarize
grep "Failed password" "$LOG_FILE" | awk '{print $1, $2, $3, $11}' | sort | uniq -c | sort -nr > temp_summary.txt

# Format the output
echo -e "Count\tDate/Time\tIP Address" >> "$SUMMARY_FILE"
while read -r line; do
    count=$(echo "$line" | awk '{print $1}')
    datetime=$(echo "$line" | awk '{print $2, $3, $4}')
    ip=$(echo "$line" | awk '{print $5}')
    echo -e "$count\t$datetime\t$ip" >> "$SUMMARY_FILE"
done < temp_summary.txt

# Clean up temporary files
rm temp_summary.txt

# Display the summary
cat "$SUMMARY_FILE"
echo "Summary saved to $SUMMARY_FILE"
