#!/bin/bash
# Network Activity Monitor Script
# This script monitors network activity and logs suspicious IPs.

# Define the log file
LOG_FILE="suspicious_ips.log"

# Function to monitor and log suspicious activity
monitor_network() {
    echo "Monitoring network activity... Press Ctrl+C to stop."

    # Infinite loop to monitor activity
    while true; do
        # Get active connections with netstat (replace with `ss` if preferred)
        netstat -tun | awk 'NR>2 {print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr > active_ips.txt

        # Read active connections and filter suspicious IPs
        while read -r line; do
            count=$(echo "$line" | awk '{print $1}')
            ip=$(echo "$line" | awk '{print $2}')

            # Example condition: log IPs with more than 10 connections
            if [[ "$count" -gt 10 ]]; then
                echo "$(date): Suspicious IP detected: $ip with $count connections" | tee -a "$LOG_FILE"
            fi
        done < active_ips.txt

        # Pause before the next check
        sleep 5
    done
}

# Main execution
echo "Network Monitor Script"
echo "Monitoring network activity for suspicious IPs (connections > 10)."
echo "Logs will be saved to $LOG_FILE."

# Start monitoring
monitor_network
