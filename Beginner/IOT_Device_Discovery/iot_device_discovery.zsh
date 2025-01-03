#!/bin/zsh
# IoT Device Discovery Script
# This script scans the local network to discover IoT devices and displays their IP, MAC address, and device type.

# Function to scan using nmap
scan_with_nmap() {
    echo "Scanning the network using nmap..."
    local subnet=$(ip -4 addr show | grep inet | grep -v 127.0.0.1 | awk '{print $2}' | cut -d/ -f1 | awk -F. '{print $1"."$2"."$3".0/24"}')
    nmap -sn "$subnet" -oG - | awk '/Up$/{ip=$2} /MAC Address:/{print ip, $3, $4, $5, $6, $7}' | sort | uniq
}

# Function to scan using arp-scan
scan_with_arpscan() {
    echo "Scanning the network using arp-scan..."
    local subnet=$(ip -4 addr show | grep inet | grep -v 127.0.0.1 | awk '{print $2}' | cut -d/ -f1 | awk -F. '{print $1"."$2"."$3".0/24"}')
    sudo arp-scan --interface=$(ip -o -4 route show to default | awk '{print $5}') --localnet | grep -v "Starting" | grep -v "Ending" | awk '{print $1, $2, $3}'
}

# Detect available tool and scan for IoT devices
if command -v nmap &>/dev/null; then
    scan_with_nmap
elif command -v arp-scan &>/dev/null; then
    scan_with_arpscan
else
    echo "Neither nmap nor arp-scan is available. Please install one of them to use this script."
    exit 1
fi
