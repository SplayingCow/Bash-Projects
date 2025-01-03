#!/bin/zsh
# CAN Bus Data Viewer
# This script monitors CAN bus traffic and displays live data.

# Define the CAN interface
CAN_INTERFACE="can0"

# Check if `candump` is installed
if ! command -v candump &>/dev/null; then
    echo "candump is not installed. Please install can-utils to use this script."
    exit 1
fi

# Function to check if the CAN interface is active
check_can_interface() {
    echo "Checking if CAN interface $CAN_INTERFACE is active..."
    if ! ip link show "$CAN_INTERFACE" &>/dev/null; then
        echo "CAN interface $CAN_INTERFACE is not found. Please ensure it exists and is up."
        exit 1
    fi
}

# Function to monitor CAN traffic
monitor_can_traffic() {
    echo "Monitoring CAN traffic on $CAN_INTERFACE... Press Ctrl+C to stop."
    candump "$CAN_INTERFACE"
}

# Function to bring up the CAN interface
bring_up_can_interface() {
    echo "Bringing up CAN interface $CAN_INTERFACE..."
    sudo ip link set "$CAN_INTERFACE" type can bitrate 500000
    sudo ip link set "$CAN_INTERFACE" up
    echo "CAN interface $CAN_INTERFACE is now up with a bitrate of 500,000 bps."
}

# Function to bring down the CAN interface
bring_down_can_interface() {
    echo "Bringing down CAN interface $CAN_INTERFACE..."
    sudo ip link set "$CAN_INTERFACE" down
    echo "CAN interface $CAN_INTERFACE is now down."
}

# Interactive menu
while true; do
    echo "CAN Bus Data Viewer"
    echo "1. Check CAN Interface"
    echo "2. Bring Up CAN Interface"
    echo "3. Monitor CAN Traffic"
    echo "4. Bring Down CAN Interface"
    echo "5. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            check_can_interface
            ;;
        2)
            bring_up_can_interface
            ;;
        3)
            monitor_can_traffic
            ;;
        4)
            bring_down_can_interface
            ;;
        5)
            echo "Exiting CAN Bus Data Viewer."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done

