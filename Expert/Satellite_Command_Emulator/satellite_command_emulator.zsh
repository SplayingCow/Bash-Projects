#!/bin/zsh
# Satellite Command Emulator
# Simulates sending, receiving, and interpreting commands for a satellite system.
# **For educational purposes only.**

# Define command log file
COMMAND_LOG="satellite_commands.log"

# Function to initialize the emulator
initialize_emulator() {
    echo "Initializing Satellite Command Emulator..."
    echo "Log file: $COMMAND_LOG"
    echo "Satellite Command Log" > "$COMMAND_LOG"
    echo "Emulator initialized."
}

# Function to send a command to the satellite
send_command() {
    read -r -p "Enter the satellite command (e.g., POWER_ON, DEPLOY_PANEL): " command
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$timestamp - Sending command: $command" | tee -a "$COMMAND_LOG"

    # Simulate command execution
    case "$command" in
        POWER_ON)
            echo "$timestamp - Satellite is powering on." | tee -a "$COMMAND_LOG"
            ;;
        DEPLOY_PANEL)
            echo "$timestamp - Solar panel deployment in progress." | tee -a "$COMMAND_LOG"
            ;;
        RESET)
            echo "$timestamp - Satellite is resetting systems." | tee -a "$COMMAND_LOG"
            ;;
        *)
            echo "$timestamp - Invalid command: $command" | tee -a "$COMMAND_LOG"
            ;;
    esac
}

# Function to view the command log
view_log() {
    if [[ -f "$COMMAND_LOG" ]]; then
        echo "Displaying Satellite Command Log:"
        cat "$COMMAND_LOG"
    else
        echo "Error: Command log file not found."
    fi
}

# Function to simulate a spoofed command attack
simulate_attack() {
    echo "Simulating a spoofed command attack..."
    malicious_command="SHUTDOWN"
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$timestamp - [ALERT] Malicious command received: $malicious_command" | tee -a "$COMMAND_LOG"
    echo "$timestamp - Satellite shutdown initiated (simulated)." | tee -a "$COMMAND_LOG"
}

# Main menu
while true; do
    echo "Satellite Command Emulator"
    echo "1. Initialize Emulator"
    echo "2. Send Command"
    echo "3. View Command Log"
    echo "4. Simulate Spoofed Command Attack"
    echo "5. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            initialize_emulator
            ;;
        2)
            send_command
            ;;
        3)
            view_log
            ;;
        4)
            simulate_attack
            ;;
        5)
            echo "Exiting Satellite Command Emulator."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
