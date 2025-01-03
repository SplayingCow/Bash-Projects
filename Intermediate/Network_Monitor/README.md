# Network Activity Monitor Script

## Overview
The **Network Activity Monitor Script** is a Bash tool designed to monitor active network connections and log suspicious IP addresses. It uses `netstat` (or `ss`) to identify potential security threats based on the number of active connections from a single IP. Suspicious activity is logged to a file for further analysis.

---

## What Was Learned

### **1. Monitoring Network Activity**
- **Commands Used**: `netstat`, `awk`, `cut`, `sort`, `uniq`
  - **Why they matter**: These tools allow efficient parsing and analysis of network connections.
  - **Example**: Listing all active TCP/UDP connections to identify IP addresses with a high number of connections.

- **Realization**: Network monitoring is crucial for spotting anomalies, such as a single IP making too many simultaneous connections, which could indicate a Denial of Service (DoS) attack or unauthorized access attempts.

### **2. Automation with Bash Scripts**
- **Infinite Loops**: The script runs in a continuous loop, checking connections at regular intervals.
  - **Why it’s important**: Ensures real-time monitoring without manual intervention.
  - **Example**: Continuously tracking new connections from suspicious IPs as they occur.

- **Log File Management**: Logs suspicious activity to a file with timestamps.
  - **Why it’s important**: Provides a persistent record for later investigation or reporting.
  - **Example**: Saving entries like:
    ```
    Thu Dec 31 12:00:00 UTC 2024: Suspicious IP detected: 192.168.1.100 with 15 connections

### **3. User-Friendly Thresholds**
- **Configurable Limits**: The script uses a default threshold (e.g., 10 connections) to flag IPs but allows easy customization.
  - **Why it’s important**: Different systems or networks may have varying levels of normal activity.
  - **Example**: A high-traffic web server might need a higher threshold to avoid false positives.

---

## Why This Is Important

### **1. Security and Intrusion Detection**
- **Identifying Threats**: High connection counts from a single IP could indicate:
  - DoS or DDoS attacks.
  - Brute force login attempts.
  - Unauthorized data scraping.
- **Utility**: Early detection of suspicious IPs can help mitigate potential breaches or system overloads.
  - **Real-life Example**: Detecting an IP spamming a login endpoint with brute force attempts.

### **2. Lightweight Monitoring**
- **On-Demand Usage**: The script provides a simple and resource-efficient alternative to heavy network monitoring tools.
  - **Utility**: Useful for smaller environments or as a quick diagnostic tool.
  - **Real-life Example**: Monitoring a personal server without installing complex software like Wireshark or Nagios.

### **3. Persistent Logging**
- **Actionable Insights**: Logs provide a historical record of suspicious activity, aiding in:
  - Forensic investigations.
  - Reporting to ISPs or authorities.
  - Blocking IPs via firewalls.
  - **Real-life Example**: Using logs to blacklist repeat offenders in a firewall configuration.

---

## Real-Life Utility

### Example 1: Detecting Brute Force Attacks
**Scenario**: A web server experiences slow performance due to repeated login attempts.
- **Without the Script**: Manually checking logs or guessing the issue.
- **With the Script**: Automatically detects and logs IPs making too many connections, allowing administrators to block them quickly.

### Example 2: Preventing DDoS Impact
**Scenario**: A small website is targeted by a DDoS attack from multiple IPs.
- **Without the Script**: The server might crash before the issue is diagnosed.
- **With the Script**: Logs high-connection IPs in real time, helping the admin implement rate-limiting or IP bans.

### Example 3: Monitoring a Home Network
**Scenario**: A home user wants to monitor for unauthorized devices accessing their network.
- **Without the Script**: Limited tools to track real-time activity.
- **With the Script**: Detects unknown IPs making frequent connections, helping secure the home network.

---

## Future Improvements

### **1. Integration with Firewall Rules**
- Automatically block suspicious IPs using tools like `iptables` or `ufw`.
  - **Why**: Provides real-time defense against identified threats.

### **2. Advanced Filtering**
- Implement filters to distinguish between legitimate and potentially malicious connections (e.g., rate-limiting per IP).
  - **Why**: Reduces false positives and ensures critical IPs are not flagged unnecessarily.

### **3. Geo-IP Lookup**
- Add functionality to identify geographic locations of flagged IPs using APIs or tools like `geoiplookup`.
  - **Why**: Helps identify patterns, such as repeated attacks from specific regions.

### **4. Scheduled Reporting**
- Generate periodic summaries of flagged IPs and overall network activity.
  - **Why**: Provides a holistic view of network security over time.

### **5. Multi-Protocol Support**
- Extend monitoring to include protocols like ICMP and ARP for broader security coverage.
  - **Why**: Enhances detection of various attack types beyond TCP/UDP.

### **6. Web Interface**
- Create a simple web dashboard to view live logs and manage thresholds or IP bans.
  - **Why**: Improves accessibility and ease of use for non-technical users.

---

## License
This script is provided "as is" without warranties. Use it at your own risk.

