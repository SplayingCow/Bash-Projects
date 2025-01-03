#!/bin/zsh
# Smart Lock Authentication Auditor
# This script scans and monitors BLE communication with a smart lock to log authentication events.

# Define the log file
LOG_FILE="smart_lock_audit_log.txt"

# Check if `hcitool` and `hcidump` are installed
if ! command -v hcitool &>/dev/null || ! command -v hcidump &>/dev/null; then
    echo "hcitool or hcidump is not installed. Please install bluez tools to use this script."
    exit 1
fi

# Function to scan for BLE devices
scan_ble_devices() {
    echo "Scanning for nearby BLE devices..."
    sudo hcitool lescan --duplicates > /tmp/ble_scan.log &
    scan_pid=$!
    sleep 10  # Allow the scan to run for 10 seconds
    sudo kill "$scan_pid" &>/dev/null
    echo "Scan complete. Devices found:"
    cat /tmp/ble_scan.log | sort | uniq
}

# Function to monitor and log BLE communication with the smart lock
monitor_ble_communication() {
    read -r -p "Enter the MAC address of the smart lock to monitor: " mac_address
    echo "Monitoring BLE communication with $mac_address... Press Ctrl+C to stop."
    echo "Timestamp, MAC Address, Data" > "$LOG_FILE"

    # Start capturing BLE traffic
    sudo hcitool lecc "$mac_address"
    sudo hcidump -X | while read -r line; do
        if [[ $line =~ "$mac_address" ]]; then
            # Log the data
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            echo "$timestamp, $mac_address, $line" >> "$LOG_FILE"
            echo "Logged: $timestamp, $line"
        fi
    done
}

# Main menu
while true; do
    echo "Smart Lock Authentication Auditor"
    echo "1. Scan for BLE Devices"
    echo "2. Monitor Smart Lock Communication"
    echo "3. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            scan_ble_devices
            ;;
        2)
            monitor_ble_communication
            ;;
        3)
            echo "Exiting Smart Lock Authentication Auditor."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done

