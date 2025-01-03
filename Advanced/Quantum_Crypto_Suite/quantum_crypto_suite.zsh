#!/bin/zsh
# Quantum Cryptography Testing Suite
# This script simulates quantum key distribution (BB84) and performs basic cryptographic testing.

# Define log file
LOG_FILE="quantum_crypto.log"

# Function to generate random bits
generate_random_bits() {
    local length=$1
    echo "Generating $length random bits..."
    bits=""
    for i in $(seq 1 $length); do
        bits+=$((RANDOM % 2))
    done
    echo "$bits"
}

# Function to simulate BB84 protocol
simulate_bb84() {
    local key_length=16
    read -r -p "Enter desired key length (default 16): " input_length
    [[ -n "$input_length" ]] && key_length=$input_length

    echo "Simulating BB84 Quantum Key Distribution..." | tee -a "$LOG_FILE"

    # Generate Alice's random bits and bases
    alice_bits=$(generate_random_bits $key_length)
    alice_bases=$(generate_random_bits $key_length)

    # Generate Bob's bases
    bob_bases=$(generate_random_bits $key_length)

    # Simulate Bob's measured bits
    bob_bits=""
    for i in $(seq 1 $key_length); do
        if [[ "${alice_bases:i-1:1}" == "${bob_bases:i-1:1}" ]]; then
            bob_bits+="${alice_bits:i-1:1}"
        else
            bob_bits+=$((RANDOM % 2))
        fi
    done

    # Compare bases to find the shared key
    shared_key=""
    for i in $(seq 1 $key_length); do
        if [[ "${alice_bases:i-1:1}" == "${bob_bases:i-1:1}" ]]; then
            shared_key+="${alice_bits:i-1:1}"
        fi
    done

    echo "Alice's Bits   : $alice_bits"
    echo "Alice's Bases  : $alice_bases"
    echo "Bob's Bases    : $bob_bases"
    echo "Bob's Measured : $bob_bits"
    echo "Shared Key     : $shared_key" | tee -a "$LOG_FILE"
}

# Function to simulate eavesdropping
simulate_eavesdropping() {
    echo "Simulating an eavesdropper (Eve)..."

    # Assume Eve intercepts and measures with random bases
    eve_bases=$(generate_random_bits 16)
    echo "Eve's Random Bases: $eve_bases"

    # Assume Eve tries to alter some bits
    altered_bits=$(generate_random_bits 16)
    echo "Eve's Altered Bits: $altered_bits" | tee -a "$LOG_FILE"
}

# Function to test basic cryptographic hashing
test_hashing() {
    read -r -p "Enter a message to hash: " message
    echo "Calculating SHA256 hash of the message..." | tee -a "$LOG_FILE"
    hash=$(echo -n "$message" | sha256sum | awk '{print $1}')
    echo "Message: $message"
    echo "Hash   : $hash" | tee -a "$LOG_FILE"
}

# Main menu
while true; do
    echo "Quantum Cryptography Testing Suite"
    echo "1. Simulate BB84 Protocol"
    echo "2. Simulate Eavesdropping"
    echo "3. Test Cryptographic Hashing"
    echo "4. Exit"
    read -r -p "Choose an option: " choice

    case $choice in
        1)
            simulate_bb84
            ;;
        2)
            simulate_eavesdropping
            ;;
        3)
            test_hashing
            ;;
        4)
            echo "Exiting Quantum Cryptography Testing Suite."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
