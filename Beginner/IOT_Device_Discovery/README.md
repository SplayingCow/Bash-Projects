# README: IoT Device Discovery Script

## **Overview**
The **IoT Device Discovery Script** is a Zsh-based tool designed to scan a local network and identify connected IoT devices. It uses either `nmap` or `arp-scan` to detect devices, displaying their IP addresses, MAC addresses, and manufacturer details.

---

## **What This Script Does**
1. **Automatically Detects Local Subnet**:
   - Dynamically identifies the subnet range based on the system's network configuration.
2. **Discovers Network Devices**:
   - Scans the local network to find connected devices, including IoT devices like smart TVs, speakers, and more.
3. **Provides Device Details**:
   - Outputs IP addresses, MAC addresses, and device/manufacturer names.
4. **Adapts to Available Tools**:
   - Uses `nmap` or `arp-scan`, whichever is installed.

---

## **Prerequisites**

### **1. Tools**
- The script requires either `nmap` or `arp-scan`.
- Install them as follows:
  - **nmap**:
    ```bash
    sudo apt install nmap  # Debian/Ubuntu
    sudo yum install nmap  # Red Hat/CentOS
    ```
  - **arp-scan**:
    ```bash
    sudo apt install arp-scan
    ```

### **2. Network Configuration**
- Ensure your machine is connected to the local network you want to scan.

### **3. Permissions**
- `arp-scan` requires `sudo` privileges to run.

---

## **How to Use**

1. **Save the Script**:
   - Save the script as `iot_device_discovery.zsh`.

2. **Make It Executable**:
   ```bash
   chmod +x iot_device_discovery.zsh
   ```

3. **Run the Script**:
   ```bash
   ./iot_device_discovery.zsh
   ```

4. **View the Results**:
   - The script will display detected devices, including their IP addresses, MAC addresses, and device information.

---

## **Sample Output**

### **Using `nmap`**:
```
Scanning the network using nmap...
192.168.1.2 00:1A:2B:3C:4D:5E Samsung Smart TV
192.168.1.3 00:1B:3D:4F:6E:7F Amazon Echo
192.168.1.4 00:1C:4E:5F:7G:8H Google Nest
```

### **Using `arp-scan`**:
```
Scanning the network using arp-scan...
192.168.1.2 00:1A:2B:3C:4D:5E Samsung Electronics
192.168.1.3 00:1B:3D:4F:6E:7F Amazon.com, Inc.
192.168.1.4 00:1C:4E:5F:7G:8H Google LLC
```

---

## **Key Features**

### **1. Tool Adaptability**
- Detects and uses the available tool (`nmap` or `arp-scan`), ensuring compatibility across systems.

### **2. Dynamic Subnet Detection**
- Automatically identifies the local subnet without requiring manual input.

### **3. Detailed Device Information**
- Provides device IPs, MAC addresses, and manufacturer details to help identify devices.

---

## **Real-Life Use Cases**

1. **Home Network Management**:
   - Identify and monitor connected IoT devices like smart TVs, speakers, cameras, and thermostats.

2. **Network Security**:
   - Detect unauthorized devices on your network.

3. **Device Inventory**:
   - Maintain an updated list of devices connected to your network for better organization and troubleshooting.

4. **Troubleshooting**:
   - Locate devices with connectivity issues or conflicting IP addresses.

---

## **Potential Enhancements**

1. **Device Categorization**:
   - Automatically classify devices into categories (e.g., TV, speaker, camera).

2. **Export Results**:
   - Save the scan results to a file for future reference or reporting.

3. **Continuous Monitoring**:
   - Add a feature to monitor the network periodically and alert on new devices.

4. **Device Manufacturer Lookup**:
   - Enhance the script to perform manufacturer lookups using the MAC address (e.g., via an API).

---

## **Troubleshooting**

1. **No Devices Found**:
   - Ensure the system is connected to the correct network.
   - Verify that `nmap` or `arp-scan` is installed.

2. **Permission Errors**:
   - Run the script with `sudo` if using `arp-scan`:
     ```bash
     sudo ./iot_device_discovery.zsh
     ```

3. **Unsupported Network Interface**:
   - Check the network interface and ensure it’s active:
     ```bash
     ip link
     ```

---

## **License**
This script is provided "as-is" for educational and personal use. Users are responsible for ensuring compliance with local network scanning laws.

---

Let me know if you'd like further modifications or enhancements!