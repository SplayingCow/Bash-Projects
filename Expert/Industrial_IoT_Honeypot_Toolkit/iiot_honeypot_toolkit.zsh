#!/bin/zsh
# Industrial IoT Honeypot Toolkit
# **Educational Use Only**: Simulates an IIoT honeypot to analyze attacker behavior.

# Define log file
LOG_FILE="iiot_honeypot.log"

# Function to initialize the honeypot
initialize_honeypot() {
    echo "Initializing Industrial IoT Honeypot..."
    echo "Log file: $LOG_FILE"
    echo "Industrial IoT Honeypot Activity Log" > "$LOG_FILE"
    echo "Honeypot initialized."
}

# Function to simulate IIoT device
simulate_device() {
    read -r -p "Enter the device type to simulate (e.g., PLC, Sensor): " device_type
    read -r -p "Enter the port number (e.g., 502 for Modbus): " port
    echo "Simulating $device_type on port $port..."
    echo "Device: $device_type, Port: $port" | tee -a "$LOG_FILE"
    while true; do
        echo "Listening for incoming connections on port $port..."
        nc -lvp "$port" | tee -a "$LOG_FILE"
    done
}

# Function to monitor activity
monitor_activity() {
    echo "Monitoring honeypot activity..."
    if [[ -f "$LOG_FILE" ]]; then
        tail -f "$LOG_FILE"
    else
        echo "Error: Log file not found. Initialize the honeypot first."
    fi
}

# Function to analyze logs
analyze_logs() {
    if [[ -f "$LOG_FILE" ]]; then
        echo "Analyzing honeypot logs for suspicious activity..."
        grep -E "login|unauthorized|access" "$LOG_FILE" | tee suspicious_activity.log
        echo "Analysis completed. Suspicious activity logged to suspicious_activity.log."
    else
        echo "Error: Log file not found."
    fi
}

# Main menu
while true; do
    echo "Industrial IoT Honeypot Toolkit"
    echo "1. Initialize Honeypot"
    echo "2. Simulate IIoT Device"
    echo "3. Monitor Honeypot Activity"
    echo "4. Analyze Honeypot Logs"
    echo "5. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            initialize_honeypot
            ;;
        2)
            simulate_device
            ;;
        3)
            monitor_activity
            ;;
        4)
            analyze_logs
            ;;
        5)
            echo "Exiting Industrial IoT Honeypot Toolkit."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
