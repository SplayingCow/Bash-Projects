#!/bin/zsh
# Basic Bluetooth Sniffer
# This script scans for nearby Bluetooth devices and lists their details.

# Function to scan using bluetoothctl
scan_with_bluetoothctl() {
    echo "Scanning for Bluetooth devices using bluetoothctl..."
    bluetoothctl --timeout 10 scan on | grep "Device" | awk '{print $2, $3, $4, $5, $6, $7, $8}' | sort | uniq
}

# Function to scan using hcitool
scan_with_hcitool() {
    echo "Scanning for Bluetooth devices using hcitool..."
    sudo hcitool scan | awk 'NR>1 {print $1, $2, $3, $4, $5, $6, $7}' | sort | uniq
}

# Detect available tool and scan for Bluetooth devices
if command -v bluetoothctl &>/dev/null; then
    scan_with_bluetoothctl
elif command -v hcitool &>/dev/null; then
    scan_with_hcitool
else
    echo "Neither bluetoothctl nor hcitool is available. Please install one of them to use this script."
    exit 1
fi
