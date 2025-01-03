#!/bin/zsh
# Wi-Fi Packet Analyzer Script
# This script captures and analyzes Wi-Fi packets using tcpdump.

# Check if tcpdump is installed
if ! command -v tcpdump &>/dev/null; then
    echo "tcpdump is not installed. Please install it to use this script."
    exit 1
fi

# Function to list available Wi-Fi interfaces
list_interfaces() {
    echo "Available Wi-Fi interfaces:"
    sudo iw dev | awk '$1=="Interface"{print $2}'
}

# Function to capture packets
capture_packets() {
    local interface=$1
    local output_file=$2
    echo "Capturing packets on interface $interface..."
    echo "Output will be saved to $output_file."
    sudo tcpdump -i "$interface" -w "$output_file"
}

# Function to analyze packets
analyze_packets() {
    local file=$1
    echo "Analyzing packets in $file..."
    tcpdump -r "$file" | head -20
}

# Main menu
echo "Wi-Fi Packet Analyzer"
echo "1. List Wi-Fi Interfaces"
echo "2. Capture Packets"
echo "3. Analyze Packets"
echo "4. Exit"
read -r -p "Choose an option: " choice

case $choice in
    1)
        list_interfaces
        ;;
    2)
        read -r -p "Enter the Wi-Fi interface to capture packets on: " interface
        read -r -p "Enter the output file name (e.g., capture.pcap): " output_file
        capture_packets "$interface" "$output_file"
        ;;
    3)
        read -r -p "Enter the capture file to analyze (e.g., capture.pcap): " file
        analyze_packets "$file"
        ;;
    4)
        echo "Exiting Wi-Fi Packet Analyzer."
        exit 0
        ;;
    *)
        echo "Invalid option. Please choose a valid action."
        ;;
esac
