#!/bin/zsh
# Simple RF Frequency Scanner
# This script scans RF frequencies using an RTL-SDR device and rtl_power.

# Define scanning parameters
START_FREQ=88e6      # Start frequency (e.g., 88 MHz for FM radio)
STOP_FREQ=108e6      # Stop frequency (e.g., 108 MHz for FM radio)
STEP_SIZE=100k       # Step size for scanning (e.g., 100 kHz)
OUTPUT_FILE="rf_scan_results.csv"  # Output file for results

# Ensure rtl_power is installed
if ! command -v rtl_power &>/dev/null; then
    echo "rtl_power is not installed. Please install rtl-sdr tools to use this script."
    exit 1
fi

# Perform the scan
echo "Starting RF frequency scan from ${START_FREQ} Hz to ${STOP_FREQ} Hz..."
rtl_power -f "${START_FREQ}:${STOP_FREQ}:${STEP_SIZE}" -g 40 -e 1m "$OUTPUT_FILE"

# Check if the scan was successful
if [[ $? -eq 0 ]]; then
    echo "RF frequency scan complete."
    echo "Results saved to $OUTPUT_FILE."
else
    echo "RF frequency scan failed. Please check your RTL-SDR device and parameters."
    exit 1
fi

# Optional: Summarize the scan results
echo "Summary of scan results:"
awk -F, '{print $1, $2, $3}' "$OUTPUT_FILE" | head -10  # Show the first 10 rows of the results
