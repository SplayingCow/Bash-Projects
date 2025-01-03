#!/bin/zsh
# Custom Port Scanner
# This script scans specified IP addresses and ports to check for open ports.

# Function to scan ports using netcat (nc)
scan_ports_nc() {
    read -r -p "Enter the target IP address: " ip
    read -r -p "Enter the port range to scan (e.g., 1-100): " port_range

    start_port=$(echo "$port_range" | cut -d- -f1)
    end_port=$(echo "$port_range" | cut -d- -f2)

    echo "Scanning ports on $ip from $start_port to $end_port using nc..."
    for port in $(seq "$start_port" "$end_port"); do
        nc -z -v -w 1 "$ip" "$port" &>/dev/null && echo "Port $port is OPEN" || echo "Port $port is CLOSED"
    done
}

# Function to scan ports using bash /dev/tcp
scan_ports_dev_tcp() {
    read -r -p "Enter the target IP address: " ip
    read -r -p "Enter the port range to scan (e.g., 1-100): " port_range

    start_port=$(echo "$port_range" | cut -d- -f1)
    end_port=$(echo "$port_range" | cut -d- -f2)

    echo "Scanning ports on $ip from $start_port to $end_port using /dev/tcp..."
    for port in $(seq "$start_port" "$end_port"); do
        (echo > /dev/tcp/"$ip"/"$port") &>/dev/null && echo "Port $port is OPEN" || echo "Port $port is CLOSED"
    done
}

# Check if nc (Netcat) is installed
if ! command -v nc &>/dev/null; then
    echo "Netcat (nc) is not installed. The script will use /dev/tcp for scanning."
fi

# Interactive menu
while true; do
    echo "Custom Port Scanner"
    echo "1. Scan Ports (Using Netcat)"
    echo "2. Scan Ports (Using /dev/tcp)"
    echo "3. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            if command -v nc &>/dev/null; then
                scan_ports_nc
            else
                echo "Netcat is not installed. Please install it or use /dev/tcp scanning."
            fi
            ;;
        2)
            scan_ports_dev_tcp
            ;;
        3)
            echo "Exiting Custom Port Scanner."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
