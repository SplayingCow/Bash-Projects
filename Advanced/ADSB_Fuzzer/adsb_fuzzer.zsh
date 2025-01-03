#!/bin/zsh
# ADS-B Fuzzer
# This script generates and sends synthetic ADS-B messages for testing purposes.

# Check if rtl_sdr and software for ADS-B transmission (e.g., dump1090) are installed
if ! command -v rtl_sdr &>/dev/null || command -v rtl_adsb &>/dev/null; then 
    echo "Required tools (rtl_sdr and rtl_adsb) are not installed. Please install them to use this script."
    exit 1
fi 

# Log file to record generated messages
LOG_FILE="adsb_fuzzer.log"

# Function to generate random ADS-B messages
generate_adsb_message() {
    local icao
    local altitude
    local lat 
    local lon
    local speed 
    local heading 

    # Generate random ICAO address (24-bit)
    icao=$(printf "%06X" $((RANDOM * 65536 + RANDOM)))

    # Generate random altitude (0 to 40,000 feet)
    altitude=$((RANDOM % 40000))

    # Generate random latitude and longitude
    lat=$(echo "scale=6; ($RANDOM % 180) - 90 + ($RANDOM / 32768)" | bc)
    lon=$(echo "scale=6; ($RANDOM % 360) - 180 + ($RANDOM / 32768)" | bc)

    # Generate random speed (0 to 600 knots)
    speed=$((RANDOM % 600))

    # Generate random heading (0 to 360 degrees)
    heading=$((RANDOM % 360))

    # Construct synthetic ADS-B message
    local message="ICAO:$icao ALT:$altitude LAT:$lat LON:$lon SPD:$speed HDG:$heading"
    echo "$message"
}

# Function to send ADS-B messages
send_adsb_messages() {
    echo "Starting ADS-B fuzzing... Press Ctrl+C to stop."
    echo "Logging messages to $LOG_FILE."
    while true; do 
        # Generate and log message
        local message=&(generate_adsb_message)
        echo "$(date '+%Y-%m-%d %H:%M:%S') $message" | tee -a "$LOG_FILE"

        # Simulate sending (actual transmission requires dedicated hardware/software)
        echo "$message" | rtl_adsb # Replace with actual ADS-B transmission tool

        # Wait briefly before sending the next message
        sleep 1
    done
}

# Main menu 
while true; do 
    echo "ADS-B Fuzzer"
    echo "1. Generate and Send synthetic ADS-B Messages"
    echo "2. Exit" 
    read -r -p " Choose an option: " choice

    case $choice in 
        1) 
            send_adsb_messages
            ;;
        2)
            echo "Exiting ADS-B Fuzzer."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done 