#!/bin/zsh
# Disk Usage Alert Script
# This script monitors disk usage and alerts when it exceeds a specified threshold.

# Define threshold (e.g., 80%)
THRESHOLD=80

# Define the alert log file
LOG_FILE="disk_usage_alert.log"

# Function to check disk usage
check_disk_usage() {
    echo "Checking disk usage..."
    df -h | awk 'NR>1 {print $5 " " $6}' | while read -r usage mount; do
        percent=$(echo "$usage" | sed 's/%//')  # Remove the % symbol
        if (( percent > THRESHOLD )); then
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            echo "$timestamp ALERT: $mount is at $percent% usage!" | tee -a "$LOG_FILE"
        fi
    done
}

# Function to display current disk usage
display_disk_usage() {
    echo "Current Disk Usage:"
    df -h
}

# Interactive menu
while true; do
    echo "Disk Usage Alert Script"
    echo "1. Check Disk Usage"
    echo "2. Display Disk Usage"
    echo "3. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            check_disk_usage
            ;;
        2)
            display_disk_usage
            ;;
        3)
            echo "Exiting Disk Usage Alert Script."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
