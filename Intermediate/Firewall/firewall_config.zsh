#!/bin/zsh
# Firewall Configuration Script
# This script configures the firewall to allow or deny traffic using ufw or iptables.

# Check if ufw or iptables is installed
if command -v ufw >/dev/null 2>&1; then
    FIREWALL="ufw"
    echo "Using UFW for firewall configuration."
elif command -v iptables >/dev/null 2>&1; then
    FIREWALL="iptables"
    echo "Using iptables for firewall configuration."
else
    echo "Neither UFW nor iptables is installed. Please install one and try again."
    exit 1
fi

# Function to add UFW rules
add_ufw_rule() {
    local action=$1
    local protocol=$2
    local port=$3
    echo "Adding UFW rule: $action $protocol on port $port"
    sudo ufw $action $protocol from any to any port $port
}

# Function to add iptables rules
add_iptables_rule() {
    local action=$1
    local protocol=$2
    local port=$3
    echo "Adding iptables rule: $action $protocol on port $port"
    if [[ "$action" == "allow" ]]; then
        sudo iptables -A INPUT -p $protocol --dport $port -j ACCEPT
    elif [[ "$action" == "deny" ]]; then
        sudo iptables -A INPUT -p $protocol --dport $port -j DROP
    fi
}

# Main menu
echo "Firewall Configuration Script"
PS3="Choose an action: "
options=("Allow Traffic" "Deny Traffic" "Exit")

select opt in "${options[@]}"; do
    case $opt in
        "Allow Traffic")
            read -r -p "Enter protocol (tcp/udp): " protocol
            read -r -p "Enter port number: " port
            if [[ "$FIREWALL" == "ufw" ]]; then
                add_ufw_rule allow "$protocol" "$port"
            else
                add_iptables_rule allow "$protocol" "$port"
            fi
            ;;
        "Deny Traffic")
            read -r -p "Enter protocol (tcp/udp): " protocol
            read -r -p "Enter port number: " port
            if [[ "$FIREWALL" == "ufw" ]]; then
                add_ufw_rule deny "$protocol" "$port"
            else
                add_iptables_rule deny "$protocol" "$port"
            fi
            ;;
        "Exit")
            echo "Exiting the script."
            break
            ;;
        *)
            echo "Invalid option. Please choose again."
            ;;
    esac
done

