# Log File Analyzer Script

## Overview
The **Log File Analyzer Script** is a Bash tool that parses system logs to identify failed login attempts. It extracts relevant data, summarizes the findings, and provides a clear report of suspicious activity, including timestamps and IP addresses. The summary is saved to a file for further analysis.

---

## What Was Learned

### **1. Parsing Log Files**
- **Command Used**: `grep`
  - **Why it’s important**: Filters log entries containing specific patterns, such as "Failed password," to focus only on relevant data.
  - **Example**: Extracting only failed login attempts from a large system log file.

### **2. Data Processing**
- **Commands Used**:
  - `awk`: Extracts specific fields from the filtered logs.
  - `sort | uniq -c | sort -nr`: Counts occurrences of unique IPs and sorts them by frequency.
  - **Why it’s important**: Allows quick identification of the most active suspicious IPs.
  - **Example**: Identifying an IP making repeated login attempts.

### **3. Summarizing and Reporting**
- **Output**:
  - The script generates a readable summary with columns for:
    - Number of failed attempts.
    - Date/Time of activity.
    - Source IP address.
  - **Why it’s important**: Provides actionable insights for system administrators.
  - **Example**: Producing a report to track unauthorized access attempts.

### **4. Automation and Cleanup**
- **Temporary File Management**:
  - Uses temporary files for intermediate data processing.
  - Cleans up after execution to avoid clutter.
  - **Why it’s important**: Keeps the workspace organized and ensures efficiency in processing.

---

## Why This Script Is Important

### **1. Enhanced Security**
- **Detecting Intrusions**:
  - Identifies repeated failed login attempts, which may indicate brute force or unauthorized access attempts.
- **Real-life Example**:
  - A web server under attack from a specific IP can use this script to flag the attacker’s activity.

### **2. Simplified Log Analysis**
- **Automation**:
  - Automates the manual process of scanning and summarizing logs, saving time and reducing errors.
- **Real-life Example**:
  - Quickly generating a report for a security audit.

### **3. Actionable Insights**
- **Focus on Key Details**:
  - Summarizes large logs into concise, meaningful data for decision-making.
- **Real-life Example**:
  - Using the summary to block repeat offenders via firewall rules.

---

## How to Use

### **1. Prerequisites**
- Ensure you have access to the system logs:
  - **Debian/Ubuntu**: `/var/log/auth.log`
  - **Red Hat/CentOS**: `/var/log/secure`
- Root privileges may be required to access the log files.

### **2. Running the Script**
1. Save the script to a file, e.g., `log_file_analyzer.sh`.
2. Make the script executable:
   ```bash
   chmod +x log_file_analyzer.sh
   ```
3. Run the script:
   ```bash
   sudo ./log_file_analyzer.sh
   ```

### **3. Output**
- The summary is displayed in the terminal and saved to a file named `failed_login_summary.txt`.

---

## Sample Output

**Console Output**:
```
Analyzing log file: /var/log/auth.log
Summary of failed login attempts:
Count    Date/Time        IP Address
10       Dec 31 12:00     192.168.1.100
5        Dec 31 11:30     203.0.113.45
Summary saved to failed_login_summary.txt
```

**File Output (`failed_login_summary.txt`)**:
```
Count    Date/Time        IP Address
10       Dec 31 12:00     192.168.1.100
5        Dec 31 11:30     203.0.113.45
```

---

## Future Improvements

### **1. Advanced Filtering**
- Add options to filter logs by date range or specific users.

### **2. Geo-IP Lookup**
- Integrate with Geo-IP services to include geographic locations of flagged IPs.

### **3. Real-Time Monitoring**
- Adapt the script for continuous log monitoring instead of static file analysis.

### **4. Extended Log Formats**
- Support other log formats, such as JSON or custom application logs.

---

## License
This script is provided "as is" without warranties. Use it at your own risk.

