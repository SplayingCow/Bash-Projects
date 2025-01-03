#!/bin/bash
# System Information Report Script
# This script generates a detailed system information report including CPU, memory, disk usage, and more.

# Function to display CPU information
cpu_info() {
    echo "--- CPU Information ---"
    lscpu | grep -E 'Model name|Architecture|CPU\(s\)|Thread\(s\) per core|Core\(s\) per socket|MHz'
    echo
}

# Function to display memory usage
memory_info() {
    echo "--- Memory Usage ---"
    free -h
    echo
}

# Function to display disk usage
disk_info() {
    echo "--- Disk Usage ---"
    df -hT | awk 'NR==1 || $1 ~ /^\/dev\//'
    echo
}

# Function to display network information
network_info() {
    echo "--- Network Information ---"
    ip -br addr
    echo
}

# Function to display system uptime
uptime_info() {
    echo "--- System Uptime ---"
    uptime -p
    echo
}

# Function to display all information
generate_report() {
    echo "=============================="
    echo "     SYSTEM INFORMATION       "
    echo "=============================="
    echo

    cpu_info
    memory_info
    disk_info
    network_info
    uptime_info
}

# Generate the system information report
generate_report

