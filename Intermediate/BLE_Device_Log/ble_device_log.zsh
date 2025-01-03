#!/bin/zsh
# BLE Device Logger
# This script scans for nearby BLE devices and logs their details.

# Define the log file
LOG_FILE="ble_device_log.txt"

# Check if `hcitool` and `hcidump` are installed
if ! command -v hcitool &>/dev/null || ! command -v hcidump &>/dev/null; then
    echo "hcitool or hcidump is not installed. Please install bluez tools to use this script."
    exit 1
fi

# Function to scan and log BLE devices
scan_ble_devices() {
    echo "Starting BLE scan... Press Ctrl+C to stop."
    echo "Logging BLE devices to $LOG_FILE."
    echo "Timestamp, MAC Address, RSSI, Name" > "$LOG_FILE"

    # Start scanning in the background
    sudo hcitool lescan --duplicates &
    scan_pid=$!

    # Use hcidump to capture and parse BLE packets
    sudo hcidump -X | while read -r line; do
        if [[ $line =~ "RSSI:" ]]; then
            # Extract MAC address and RSSI
            mac=$(echo "$line" | awk '/bdaddr/ {print $2}')
            rssi=$(echo "$line" | awk '/RSSI:/ {print $NF}')

            # Log the data
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            echo "$timestamp, $mac, $rssi, Unknown" >> "$LOG_FILE"
            echo "Logged: $timestamp, $mac, $rssi"
        fi
    done

    # Stop scanning when the user interrupts
    trap "sudo kill $scan_pid; exit" INT
}

# Start BLE device logging
scan_ble_devices
