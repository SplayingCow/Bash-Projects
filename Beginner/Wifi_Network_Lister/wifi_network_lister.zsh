#!/bin/zsh
# Wi-Fi Network Lister
# This script lists all available Wi-Fi networks.

# Function to list Wi-Fi networks using nmcli
list_with_nmcli() {
    echo "Listing Wi-Fi networks using nmcli:"
    nmcli dev wifi list | awk 'NR==1 || $1!~/^--/ {print $0}'
}

# Function to list Wi-Fi networks using iwlist
list_with_iwlist() {
    echo "Listing Wi-Fi networks using iwlist:"
    sudo iwlist scan | grep -E 'ESSID|Signal level' | awk -F':' '/ESSID/ {print "SSID: " $2} /Signal level/ {print "Signal: " $2}' | sed 's/"//g'
}

# Detect available tool and list Wi-Fi networks
if command -v nmcli &>/dev/null; then
    list_with_nmcli
elif command -v iwlist &>/dev/null; then
    list_with_iwlist
else
    echo "Neither nmcli nor iwlist is available. Please install one of them to use this script."
    exit 1
fi
