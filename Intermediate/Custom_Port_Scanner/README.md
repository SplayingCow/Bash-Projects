# **Educational README: Custom Port Scanner Script**

## **Overview**

The **Custom Port Scanner Script** is a Zsh-based utility designed to help users understand and perform port scanning. Port scanning is a fundamental network security practice used to identify open ports on a target system, which can indicate potential vulnerabilities or misconfigurations. This script provides two scanning methods—using `Netcat` and the `/dev/tcp` feature—making it a versatile tool for learning about TCP communication.

---

## **What You Will Learn**

### **1. Basics of Port Scanning**
- **What is port scanning?**
  - It’s the process of sending network packets to specific ports on a target system to determine whether they are open or closed.
- **Why is it important?**
  - Identifying open ports helps administrators secure their networks by closing unnecessary ports or services.

### **2. TCP Communication**
- Learn how TCP establishes connections and communicates using ports.
- Understand how open ports provide access to services like HTTP (port 80), SSH (port 22), and others.

### **3. Tools for Scanning**
- **Netcat (`nc`)**:
  - A versatile networking utility often called the "Swiss Army knife" of networking.
  - Used here to quickly test for open ports.
- **Bash `/dev/tcp`**:
  - A built-in feature in Bash that allows direct TCP communication.
  - Useful when Netcat is unavailable.

### **4. Scripting Concepts**
- Input handling: Accepting user inputs for target IP addresses and port ranges.
- Iteration: Using loops to scan a range of ports.
- Conditional logic: Determining and displaying the status of each port.

---

## **How the Script Works**

### **1. Scanning with Netcat (`nc`)**
- **How it works**:
  - Netcat attempts to establish a connection to each port in the specified range.
  - If the connection succeeds, the port is marked as "OPEN"; otherwise, it’s "CLOSED."
- **Example Command**:
  ```bash
  nc -z -v -w 1 192.168.1.1 22
  ```
  - **`-z`**: Performs a scan without sending data.
  - **`-v`**: Enables verbose output.
  - **`-w 1`**: Sets a 1-second timeout.

---

### **2. Scanning with `/dev/tcp`**
- **How it works**:
  - Bash attempts to write data to the target IP and port using the `/dev/tcp` feature.
  - If the write succeeds, the port is "OPEN"; otherwise, it’s "CLOSED."
- **Example Command**:
  ```bash
  echo > /dev/tcp/192.168.1.1/22
  ```
  - If this command completes without error, the port is open.

---

### **3. Interactive Menu**
The script provides an easy-to-use menu:
1. **Scan Ports (Using Netcat)**:
   - Scans the specified IP and port range using Netcat.
2. **Scan Ports (Using /dev/tcp)**:
   - Scans the specified IP and port range using Bash’s `/dev/tcp`.
3. **Exit**:
   - Exits the script.

---

## **Educational Value**

### **1. Understanding Open and Closed Ports**
- Learn to identify open ports and understand their implications.
- Example:
  - An open port 22 usually means an SSH service is available.

### **2. Network Security Awareness**
- Understand how attackers use port scanning to find vulnerable services.
- Learn the importance of closing unnecessary ports and using firewalls.

### **3. Practical Scripting Skills**
- Explore Zsh scripting techniques, including:
  - Loops (`for`).
  - Conditional logic (`if`).
  - Input handling (`read`).

### **4. Tool Familiarity**
- Get hands-on experience with Netcat and `/dev/tcp`, which are essential tools for network administrators and penetration testers.

---

## **Real-World Use Cases**

### **1. Network Security Auditing**
- Verify that only necessary ports are open on a server.
- Example: Ensure port 80 (HTTP) is open but port 23 (Telnet) is closed.

### **2. Troubleshooting**
- Test if a specific service (e.g., a web server or database) is accessible on its assigned port.

### **3. Educational Exercises**
- Use the script to teach students or colleagues about port scanning and TCP/IP.

---

## **Sample Output**

### **Netcat Scanning**
```
Enter the target IP address: 192.168.1.1
Enter the port range to scan (e.g., 1-100): 20-25
Scanning ports on 192.168.1.1 from 20 to 25 using nc...
Port 20 is CLOSED
Port 21 is OPEN
Port 22 is OPEN
Port 23 is CLOSED
Port 24 is CLOSED
Port 25 is OPEN
```

### **/dev/tcp Scanning**
```
Enter the target IP address: 192.168.1.1
Enter the port range to scan (e.g., 1-100): 20-25
Scanning ports on 192.168.1.1 from 20 to 25 using /dev/tcp...
Port 20 is CLOSED
Port 21 is OPEN
Port 22 is OPEN
Port 23 is CLOSED
Port 24 is CLOSED
Port 25 is OPEN
```

---

## **Potential Enhancements**

1. **Service Identification**:
   - Use tools like `nmap` or integrate service identification to display what’s running on each open port.

2. **Multi-Threaded Scanning**:
   - Improve speed by scanning multiple ports in parallel.

3. **Logging**:
   - Save scan results to a file for future reference.

4. **Advanced Protocols**:
   - Extend the script to scan UDP ports or test specific protocols like HTTPS.

5. **Real-Time Alerts**:
   - Send notifications if specific ports are unexpectedly open.

---

## **Responsible Usage**

- **Use this script only on systems you own or have explicit permission to scan.**
- Unauthorized port scanning can be considered illegal or malicious in many jurisdictions.

---

## **Conclusion**

The **Custom Port Scanner Script** is an educational tool that demonstrates the basics of port scanning, network security, and TCP communication. It’s ideal for students, system administrators, and anyone interested in learning about network protocols and security practices. Use this script to understand your network better and build foundational skills in cybersecurity!