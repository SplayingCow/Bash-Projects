#!/bin/zsh
# Intrusion Detection System (IDS)
# This script monitors network activity and detects potential intrusions.

# Define log file
LOG_FILE="intrusion_detection.log"
ALERT_FILE="alerts.log"

# Function to monitor network connections
monitor_network() {
    echo "Monitoring network activity... Press Ctrl+C to stop."
    echo "Timestamp, IP Address, Connection Count" > "$LOG_FILE"

    while true; do
        # Extract active connections and count occurrences
        netstat -tun | awk 'NR>2 {print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr > /tmp/active_connections.txt

        # Read and log connections
        while read -r line; do
            count=$(echo "$line" | awk '{print $1}')
            ip=$(echo "$line" | awk '{print $2}')

            # Log the connection
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            echo "$timestamp, $ip, $count" >> "$LOG_FILE"

            # Trigger an alert if connections exceed a threshold
            if [[ "$count" -gt 10 ]]; then
                echo "ALERT: Potential intrusion detected from $ip with $count connections at $timestamp" | tee -a "$ALERT_FILE"
            fi
        done < /tmp/active_connections.txt

        # Pause before the next scan
        sleep 5
    done
}

# Function to check logs for suspicious IPs
analyze_logs() {
    echo "Analyzing logs for suspicious activity..."
    awk -F, '{if ($3 > 10) print $2}' "$LOG_FILE" | sort | uniq -c | sort -nr > /tmp/suspicious_ips.txt

    echo "Suspicious IPs:"
    cat /tmp/suspicious_ips.txt
}

# Function to block a suspicious IP
block_ip() {
    read -r -p "Enter the IP address to block: " ip
    echo "Blocking IP address $ip..."
    sudo iptables -A INPUT -s "$ip" -j DROP
    echo "IP address $ip has been blocked." | tee -a "$ALERT_FILE"
}

# Main menu
while true; do
    echo "Intrusion Detection System (IDS)"
    echo "1. Monitor Network Activity"
    echo "2. Analyze Logs for Suspicious IPs"
    echo "3. Block Suspicious IP"
    echo "4. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            monitor_network
            ;;
        2)
            analyze_logs
            ;;
        3)
            block_ip
            ;;
        4)
            echo "Exiting Intrusion Detection System."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
