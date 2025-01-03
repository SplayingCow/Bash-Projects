#!/bin/zsh
# Satellite Signal Decoder
# This script captures satellite signals using an SDR and decodes them.

# Check if rtl_fm and gr-satellites are installed
if ! command -v rtl_fm &>/dev/null || ! command -v gr_satellites &>/dev/null; then
    echo "rtl_fm or gr-satellites is not installed. Please install them to use this script."
    exit 1
fi

# Variables for signal capture
CENTER_FREQ=137.1e6         # Center frequency for NOAA satellites (in Hz)
SAMPLE_RATE=24000           # Sampling rate (in Hz)
OUTPUT_FILE="satellite.raw" # File to store raw signal data

# Function to capture satellite signals
capture_signal() {
    echo "Capturing satellite signal at ${CENTER_FREQ} Hz..."
    rtl_fm -f "$CENTER_FREQ" -s "$SAMPLE_RATE" -g 40 - | tee "$OUTPUT_FILE"
    echo "Signal capture complete. Data saved to $OUTPUT_FILE."
}

# Function to decode satellite signals
decode_signal() {
    echo "Decoding satellite signal from $OUTPUT_FILE..."
    gr_satellites --srate="$SAMPLE_RATE" --file-input="$OUTPUT_FILE"
    echo "Decoding complete."
}

# Interactive menu
echo "Satellite Signal Decoder"
echo "1. Capture Satellite Signal"
echo "2. Decode Satellite Signal"
echo "3. Exit"
read -r -p "Choose an option: " choice

case $choice in
    1)
        capture_signal
        ;;
    2)
        decode_signal
        ;;
    3)
        echo "Exiting Satellite Signal Decoder."
        exit 0
        ;;
    *)
        echo "Invalid option. Please choose a valid action."
        ;;
esac
