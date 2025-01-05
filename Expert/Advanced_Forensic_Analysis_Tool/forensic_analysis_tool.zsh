#!/bin/zsh
# Advanced Forensic Analysis Tool
# For educational use: Analyze file metadata, detect anomalies, and scan systems for forensic investigations.

# Define log file
LOG_FILE="forensic_analysis.log"

# Initialize forensic analysis environment
initialize_analysis() {
    echo "Initializing Forensic Analysis Tool..."
    echo "Log file: $LOG_FILE"
    echo "Advanced Forensic Analysis Log" > "$LOG_FILE"
    echo "Environment initialized."
}

# Analyze file metadata
analyze_metadata() {
    read -r "file_path?Enter the file path to analyze: "
    if [[ ! -f "$file_path" ]]; then
        echo "Error: File not found."
        return
    fi

    echo "Analyzing metadata for $file_path..."
    echo "Metadata for $file_path:" >> "$LOG_FILE"
    stat "$file_path" >> "$LOG_FILE"
    echo "Metadata analysis completed. Results logged to $LOG_FILE."
}

# Detect anomalies in system logs
detect_anomalies() {
    echo "Scanning system logs for anomalies..."
    echo "Anomalies detected in system logs:" >> "$LOG_FILE"
    sudo grep -E "unauthorized|failed|error" /var/log/syslog >> "$LOG_FILE" 2>/dev/null
    sudo grep -E "unauthorized|failed|error" /var/log/auth.log >> "$LOG_FILE" 2>/dev/null
    echo "Anomaly detection completed. Results logged to $LOG_FILE."
}

# Scan for suspicious processes
scan_suspicious_processes() {
    echo "Scanning for suspicious processes..."
    echo "Suspicious processes detected:" >> "$LOG_FILE"
    ps aux | grep -E "nc|netcat|python|perl|bash" | grep -v "grep" >> "$LOG_FILE"
    echo "Process scan completed. Results logged to $LOG_FILE."
}

# Main menu
while true; do
    echo "Advanced Forensic Analysis Tool"
    echo "1. Initialize Analysis Environment"
    echo "2. Analyze File Metadata"
    echo "3. Detect Anomalies in System Logs"
    echo "4. Scan for Suspicious Processes"
    echo "5. View Analysis Logs"
    echo "6. Exit"
    read -r "choice?Choose an option: "

    case $choice in
        1)
            initialize_analysis
            ;;
        2)
            analyze_metadata
            ;;
        3)
            detect_anomalies
            ;;
        4)
            scan_suspicious_processes
            ;;
        5)
            cat "$LOG_FILE"
            ;;
        6)
            echo "Exiting Advanced Forensic Analysis Tool."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid action."
            ;;
    esac
done
