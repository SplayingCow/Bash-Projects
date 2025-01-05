# **README: Advanced Forensic Analysis Tool**

## **Overview**

The **Advanced Forensic Analysis Tool** is a Zsh-based script designed to aid in forensic investigations by analyzing file metadata, detecting anomalies in system logs, and scanning for suspicious processes. It serves as an educational tool for understanding the basics of digital forensics, providing hands-on experience with practical forensic techniques.

This script is particularly useful for students, professionals, and hobbyists who want to explore forensic workflows in a controlled environment.

---

## **Features**

1. **Initialize Forensic Analysis Environment**:
   - Sets up the environment and creates a log file to store forensic findings.

2. **Analyze File Metadata**:
   - Extracts file attributes such as size, creation time, modification time, and permissions.

3. **Detect Anomalies in System Logs**:
   - Searches for suspicious patterns (e.g., unauthorized access, errors) in system and authentication logs.

4. **Scan for Suspicious Processes**:
   - Identifies potentially malicious processes running on the system.

5. **View Forensic Logs**:
   - Displays all recorded findings from the log file.

---

## **How It Works**

### **1. Initialization**
- Sets up a log file (`forensic_analysis.log`) to document all findings.
- Ensures the forensic environment is ready for analysis.

### **2. File Metadata Analysis**
- Uses the `stat` command to extract metadata from a specified file.
- Logs details such as:
  - File size.
  - Last access and modification times.
  - Permissions and ownership.

### **3. Anomaly Detection in Logs**
- Scans system logs (`/var/log/syslog`) and authentication logs (`/var/log/auth.log`) for:
  - Unauthorized access attempts.
  - Errors or failed operations.

### **4. Process Scanning**
- Lists suspicious processes by searching for common attack-related tools (e.g., `netcat`, `python`, `perl`).
- Helps detect malicious scripts or unauthorized shell processes.

---

## **Setup Instructions**

### **1. Prerequisites**
Ensure the following tools are installed:
- **Core utilities** (e.g., `stat`, `grep`).
- Install missing tools using:
  ```bash
  sudo apt install coreutils grep
  ```

### **2. Save and Run the Script**
1. Save the script as `forensic_analysis_tool.zsh`.
2. Make it executable:
   ```bash
   chmod +x forensic_analysis_tool.zsh
   ```
3. Run the script:
   ```bash
   sudo ./forensic_analysis_tool.zsh
   ```

---

## **Menu Options**

### **1. Initialize Analysis Environment**
- Prepares the environment by creating a clean log file.
- Example:
  ```
  Initializing Forensic Analysis Tool...
  Log file: forensic_analysis.log
  Advanced Forensic Analysis Log
  Environment initialized.
  ```

### **2. Analyze File Metadata**
- Prompts for a file path and logs its metadata.
- Example:
  ```
  Enter the file path to analyze: /home/user/example.txt
  Metadata analysis completed. Results logged to forensic_analysis.log.
  ```

### **3. Detect Anomalies in System Logs**
- Scans system and authentication logs for suspicious patterns.
- Example:
  ```
  Scanning system logs for anomalies...
  Anomaly detection completed. Results logged to forensic_analysis.log.
  ```

### **4. Scan Suspicious Processes**
- Lists potentially malicious processes running on the system.
- Example:
  ```
  Scanning for suspicious processes...
  Process scan completed. Results logged to forensic_analysis.log.
  ```

### **5. View Forensic Logs**
- Displays all findings recorded in the log file.

### **6. Exit**
- Exits the program gracefully.

---

## **Sample Outputs**

### **1. File Metadata**
```
Metadata for /home/user/example.txt:
  File: /home/user/example.txt
  Size: 1234       Blocks: 8          IO Block: 4096   regular file
  Access: 2025-01-01 12:00:00.000000000 +0000
  Modify: 2025-01-01 11:50:00.000000000 +0000
  Change: 2025-01-01 11:45:00.000000000 +0000
```

### **2. Anomaly Detection**
```
Anomalies detected in system logs:
  Jan 01 12:00:00 unauthorized access attempt detected
  Jan 01 12:05:00 failed password for root from 192.168.1.100
```

### **3. Suspicious Processes**
```
Suspicious processes detected:
  user   12345  0.0  0.1 123456 1234 ? S    12:00   0:00 nc -lvp 4444
  user   54321  0.1  0.2 654321 4321 ? S    12:05   0:01 python exploit.py
```

---

## **Educational Objectives**

1. **File Metadata Analysis**:
   - Learn how to interpret file metadata for forensic evidence.

2. **Log Analysis**:
   - Understand how to detect unauthorized access or suspicious activity in system logs.

3. **Process Monitoring**:
   - Explore how to identify potentially malicious processes and understand their impact.

4. **Incident Response**:
   - Simulate a forensic investigation to practice real-world incident response techniques.

---

## **Real-World Applications**

1. **Incident Detection**:
   - Quickly gather evidence during a cybersecurity incident.

2. **Threat Hunting**:
   - Proactively detect malicious activities or vulnerabilities in a system.

3. **File Integrity Monitoring**:
   - Analyze file metadata to ensure no unauthorized modifications.

4. **Forensic Training**:
   - Practice forensic workflows in a safe, educational environment.

---

## **Potential Enhancements**

1. **Automated Reporting**:
   - Add functionality to generate detailed forensic reports.

2. **Advanced Log Parsing**:
   - Use more sophisticated regular expressions to detect specific attack patterns.

3. **Network Activity Monitoring**:
   - Integrate tools to monitor real-time network traffic for forensic analysis.

4. **Anomaly Scoring**:
   - Implement a scoring system to prioritize potential threats.

---

## **Legal and Ethical Considerations**

1. **Authorized Use Only**:
   - Use this tool only on systems you own or have explicit permission to analyze.

2. **Data Privacy**:
   - Ensure sensitive data is handled securely and not exposed during analysis.

3. **Compliance**:
   - Adhere to all applicable laws and organizational policies when conducting forensic investigations.

---

## **Conclusion**

The **Advanced Forensic Analysis Tool** provides a practical and educational approach to learning digital forensics. By analyzing file metadata, detecting log anomalies, and identifying suspicious processes, users can simulate real-world forensic workflows. This tool is a great starting point for building more advanced forensic solutions. Use it responsibly to enhance your knowledge and skills in cybersecurity.