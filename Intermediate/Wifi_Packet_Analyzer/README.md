# README: Wi-Fi Packet Analyzer Script

## **Overview**
The **Wi-Fi Packet Analyzer Script** is a Zsh-based tool for capturing and analyzing Wi-Fi packets using `tcpdump`. It provides an interactive menu to list available Wi-Fi interfaces, capture packets on a selected interface, and analyze saved packet captures. This script is useful for troubleshooting, security monitoring, and learning about network traffic.

---

## **What the Script Does**
1. **Lists Available Wi-Fi Interfaces**:
   - Identifies Wi-Fi interfaces on the system using the `iw` tool.
2. **Captures Wi-Fi Packets**:
   - Uses `tcpdump` to capture packets on a selected interface and saves the output in a `.pcap` file.
3. **Analyzes Captured Packets**:
   - Reads and summarizes the packet capture file for quick inspection.

---

## **Prerequisites**

### **1. Required Tools**
- **`tcpdump`**:
  - Install it using:
    - **Debian/Ubuntu**:
      ```bash
      sudo apt install tcpdump
      ```
    - **Red Hat/CentOS**:
      ```bash
      sudo yum install tcpdump
      ```
- **`iw`**:
  - To list Wi-Fi interfaces:
    ```bash
    sudo apt install iw
    ```

### **2. Permissions**
- Root privileges are required to capture Wi-Fi packets. Run the script with `sudo`.

### **3. Monitor Mode (Optional)**
- To capture raw Wi-Fi traffic, the network interface may need to be in monitor mode:
  ```bash
  sudo ip link set wlan0 down
  sudo iw wlan0 set monitor control
  sudo ip link set wlan0 up
  ```

---

## **How to Use**

1. **Save the Script**:
   - Save the script as `wifi_packet_analyzer.zsh`.

2. **Make It Executable**:
   ```bash
   chmod +x wifi_packet_analyzer.zsh
   ```

3. **Run the Script**:
   ```bash
   sudo ./wifi_packet_analyzer.zsh
   ```

4. **Follow the Menu**:
   - **Option 1**: List available Wi-Fi interfaces.
   - **Option 2**: Capture packets on a selected interface.
   - **Option 3**: Analyze a previously captured `.pcap` file.
   - **Option 4**: Exit the script.

---

## **Sample Output**

### **Menu**:
```
Wi-Fi Packet Analyzer
1. List Wi-Fi Interfaces
2. Capture Packets
3. Analyze Packets
4. Exit
Choose an option: _
```

### **List Wi-Fi Interfaces**:
```
Available Wi-Fi interfaces:
wlan0
```

### **Capture Packets**:
```
Capturing packets on interface wlan0...
Output will be saved to capture.pcap.
```

### **Analyze Packets**:
```
Analyzing packets in capture.pcap...
16:34:58.123456 00:1A:2B:3C:4D:5E > 11:22:33:44:55:66, ethertype IPv4 (0x0800), length 74: ...
16:34:59.654321 11:22:33:44:55:66 > 00:1A:2B:3C:4D:5E, ethertype ARP (0x0806), length 42: ...
```

---

## **Key Features**

1. **Interactive Menu**:
   - User-friendly options for listing interfaces, capturing packets, and analyzing captures.

2. **Capture Wi-Fi Packets**:
   - Saves packet data to a `.pcap` file for later analysis with tools like Wireshark.

3. **Quick Packet Analysis**:
   - Displays a summary of captured packets directly in the terminal.

---

## **Real-Life Use Cases**

1. **Network Troubleshooting**:
   - Diagnose connectivity issues or identify bottlenecks in Wi-Fi networks.

2. **Security Monitoring**:
   - Monitor Wi-Fi traffic to detect potential threats or suspicious activity.

3. **IoT Traffic Analysis**:
   - Analyze traffic from IoT devices to ensure secure communication.

4. **Learning and Education**:
   - Explore packet structure and network behavior for educational purposes.

---

## **Potential Enhancements**

1. **Protocol Filtering**:
   - Add options to filter packets by protocol (e.g., HTTP, ARP, DNS).

2. **Live Packet Display**:
   - Show packets in real-time during capture.

3. **File Export**:
   - Save packet analysis results in a readable text file.

4. **Wireshark Integration**:
   - Automatically open the `.pcap` file in Wireshark after capture.

---

## **Troubleshooting**

1. **`tcpdump` Not Found**:
   - Ensure `tcpdump` is installed. Reinstall if necessary:
     ```bash
     sudo apt install tcpdump
     ```

2. **No Interfaces Detected**:
   - Verify that the Wi-Fi interface is active:
     ```bash
     ip link
     ```

3. **Permission Errors**:
   - Run the script with `sudo`:
     ```bash
     sudo ./wifi_packet_analyzer.zsh
     ```

4. **Monitor Mode Issues**:
   - Ensure the Wi-Fi interface is in monitor mode using the following commands:
     ```bash
     sudo ip link set wlan0 down
     sudo iw wlan0 set monitor control
     sudo ip link set wlan0 up
     ```

---

## **License**
This script is provided "as-is" for educational and personal use. Ensure compliance with local laws and regulations regarding packet capturing.

