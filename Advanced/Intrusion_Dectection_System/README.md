# **README: Intrusion Detection System (IDS)**

## **Introduction**

The **Intrusion Detection System (IDS)** script is a hands-on learning tool designed to teach the fundamentals of network security and intrusion detection. It provides an interactive way to monitor network activity, detect potential intrusions, and take action against suspicious behavior. By exploring the concepts implemented in this script, you will gain practical knowledge of network monitoring, logging, and threat mitigation techniques.

---

## **What Will You Learn?**

### **1. Basics of Network Security**
- Understand the role of intrusion detection systems in monitoring and protecting network activity.
- Learn how attackers exploit vulnerabilities like excessive connections or brute-force login attempts.

### **2. Real-Time Monitoring**
- Use tools like `netstat` to observe active network connections and identify patterns of suspicious behavior.

### **3. Logging and Analysis**
- Learn how to create and analyze log files to detect recurring malicious activity and track historical data.

### **4. Firewall Management**
- Understand how to use `iptables` to block unwanted traffic and secure network resources.

### **5. Practical Scripting Skills**
- Explore how Zsh scripting can automate network security tasks and improve efficiency.

---

## **Script Features**

1. **Monitor Network Activity**:
   - Continuously tracks network connections and logs the source IP addresses and connection counts.
   - Provides real-time alerts for IPs that exceed a specified connection threshold.

2. **Analyze Logs**:
   - Reviews historical logs to identify IPs with frequent suspicious behavior.

3. **Block Malicious IPs**:
   - Uses the `iptables` firewall to block incoming traffic from identified attackers.

4. **Educational Logging**:
   - Generates detailed logs for studying network activity and intrusion patterns.

---

## **How It Works**

### **1. Network Monitoring**
- The script uses `netstat` to monitor network connections in real time.
- **Concept**: 
  - Every device connected to a network has an IP address. By tracking connections, we can detect unusual patterns, such as one IP making too many requests.
- **Learning Example**:
  - An IP opening 50 connections to a web server in seconds might indicate a **DDoS attack**.

### **2. Real-Time Alerts**
- The script triggers an alert if the number of connections from a single IP exceeds 10 (default threshold).
- **Concept**: 
  - Monitoring thresholds help differentiate normal behavior from suspicious activity.
- **Learning Example**:
  - A legitimate user might make 2-3 connections simultaneously, but a bot attempting to brute-force a password could make dozens.

### **3. Log Analysis**
- Historical logs are parsed to identify recurring suspicious IPs.
- **Concept**: 
  - Logs act as a history book for network activity, helping identify patterns over time.
- **Learning Example**:
  - If one IP repeatedly triggers alerts over days, it might indicate a persistent threat actor.

### **4. Blocking Malicious IPs**
- Uses `iptables` to block traffic from suspicious IPs.
- **Concept**:
  - A firewall acts like a gatekeeper, allowing or denying traffic based on predefined rules.
- **Learning Example**:
  - Blocking an attacker’s IP prevents further exploitation of network vulnerabilities.

---

## **How to Use**

### **1. Save and Set Up**
1. Save the script as `intrusion_detection_system.zsh`.
2. Make it executable:
   ```bash
   chmod +x intrusion_detection_system.zsh
   ```

### **2. Run the Script**
```bash
sudo ./intrusion_detection_system.zsh
```

### **3. Explore the Menu**
- **Option 1**: Monitor real-time network activity.
- **Option 2**: Analyze logs to identify suspicious IPs.
- **Option 3**: Block suspicious IPs using `iptables`.
- **Option 4**: Exit the script.

---

## **Learning Scenarios**

### **Scenario 1: DDoS Attack Detection**
- **What to Do**:
  - Use the monitoring feature to detect IPs with excessive connections.
- **What to Learn**:
  - How Distributed Denial of Service (DDoS) attacks overwhelm systems by flooding them with requests.

### **Scenario 2: Brute-Force Prevention**
- **What to Do**:
  - Identify repeated connection attempts from a single IP in the logs.
- **What to Learn**:
  - How attackers try to guess passwords through brute force and how to block their IPs.

### **Scenario 3: Understanding Network Traffic**
- **What to Do**:
  - Review the logs to observe typical and unusual network behaviors.
- **What to Learn**:
  - Differentiate between normal user activity and potential malicious actions.

---

## **Educational Insights**

### **1. Why Monitor Connections?**
- **Example**: A web server typically handles connections from many users. If one user opens hundreds of connections in a short time, it might be a bot or attacker.
- **What You Learn**: 
  - Normal vs. abnormal network traffic patterns.

### **2. Why Analyze Logs?**
- **Example**: Logs help you see the "bigger picture" over time, revealing persistent threats.
- **What You Learn**:
  - The importance of record-keeping in cybersecurity.

### **3. Why Use a Firewall?**
- **Example**: Firewalls block malicious traffic, like locking a door to keep intruders out.
- **What You Learn**:
  - Practical skills for managing firewall rules.

---

## **Sample Outputs**

### **Real-Time Monitoring**:
```
Monitoring network activity... Press Ctrl+C to stop.
ALERT: Potential intrusion detected from 192.168.1.50 with 15 connections at 2024-01-01 10:00:00
```

### **Log Analysis**:
```
Suspicious IPs:
  3 192.168.1.50
  1 10.0.0.1
```

### **Blocking IP**:
```
Enter the IP address to block: 192.168.1.50
Blocking IP address 192.168.1.50...
IP address 192.168.1.50 has been blocked.
```

---

## **Key Concepts You’ll Learn**

1. **Threshold-Based Alerts**:
   - Set limits for normal activity and identify anomalies.
2. **Network Tools**:
   - Use `netstat`, `iptables`, and Zsh scripting for security tasks.
3. **Log Management**:
   - Understand how logs are critical for identifying and mitigating threats.
4. **Firewall Configuration**:
   - Block unauthorized access and secure your systems effectively.

---

## **Challenges to Try**

1. **Custom Thresholds**:
   - Modify the connection threshold and test how it affects alerts.
2. **Geolocation**:
   - Add functionality to identify the geographic location of suspicious IPs.
3. **Automation**:
   - Schedule the IDS to run periodically using `cron`.

---

## **Legal and Ethical Use**

- **Authorized Use Only**:
  - Use this tool only on networks you own or have explicit permission to monitor.
- **Ethical Responsibility**:
  - Unauthorized monitoring is illegal and violates privacy rights.

---

## **Conclusion**

The **Intrusion Detection System (IDS)** script is an educational tool for learning network security concepts. It provides practical experience in monitoring, detecting, and mitigating potential threats. By using this tool, you’ll gain valuable insights into how cybersecurity professionals secure networks and prevent intrusions. Start exploring to build your network security expertise!