#!/bin/bash
# Process Monitor Script
# This script monitors a specific process and notifies the user when it starts or stops.

# Function to check if a process is running
is_running() {
    pgrep -x "$1" &>/dev/null  # Check if the process is running
    return $?  # Return the exit code (0 if running, 1 if not)
}

# Prompt user for the process name
read -r -p "Enter the process name to monitor: " process_name

# Initialize process state
previous_state="unknown"

# Start monitoring
while true; do
    if is_running "$process_name"; then
        if [[ $previous_state != "running" ]]; then
            echo "Process '$process_name' has started."  # Notify that the process started
            previous_state="running"
        fi
    else
        if [[ $previous_state != "stopped" ]]; then
            echo "Process '$process_name' has stopped."  # Notify that the process stopped
            previous_state="stopped"
        fi
    fi

    # Sleep for a while to avoid excessive CPU usage
    sleep 5  # Check every 5 seconds

done
