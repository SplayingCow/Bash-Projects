# Firewall Configuration Script

## Overview
The **Firewall Configuration Script** is a Zsh-based utility that automates the process of configuring a firewall using either `ufw` or `iptables`. It provides an interactive menu for allowing or denying traffic based on protocols and ports, making firewall management simple and user-friendly.

---

## What Was Learned

### **1. Managing Firewalls with Scripting**
- **Automating Rules**: Simplifies the process of configuring firewalls through a script.
  - **Why it’s important**: Reduces manual errors and speeds up rule configuration.
  - **Example**: Adding a rule to allow traffic on port 80 for HTTP services.

- **Compatibility with Multiple Tools**:
  - Detects and uses the appropriate firewall tool (`ufw` or `iptables`) installed on the system.
  - **Why it’s important**: Ensures compatibility across different Linux distributions.

### **2. Dynamic Rule Configuration**
- **Interactive Prompts**: Guides users to input the necessary details, such as protocol and port.
  - **Why it’s important**: Makes the script accessible to users without deep technical expertise.
  - **Example**: Prompting the user to allow traffic on `tcp` for port `443` (HTTPS).

### **3. Modular Functions**
- **Reusability**: Encapsulates rule additions in functions for `ufw` and `iptables`.
  - **Why it’s important**: Enhances code clarity and maintainability.
  - **Example**: `add_ufw_rule` and `add_iptables_rule` handle their respective tool's syntax seamlessly.

---

## Why This Script Is Important

### **1. Simplified Firewall Management**
- **Streamlines Setup**:
  - Automates rule configuration for common use cases, such as opening ports for web servers or denying unauthorized access.
- **Real-Life Example**:
  - A system admin quickly allows SSH traffic on port 22 while blocking other unnecessary connections.

### **2. Improved Security**
- **Access Control**:
  - Denying traffic from unused ports reduces attack surface.
- **Real-Life Example**:
  - Blocking UDP traffic on port 123 prevents potential exploitation of the NTP service.

### **3. Versatility**
- **Supports Multiple Tools**:
  - Works with both `ufw` and `iptables`, covering a wide range of Linux distributions.
- **Real-Life Example**:
  - The script automatically configures `ufw` on Ubuntu servers and `iptables` on CentOS.

---

## How to Use

### **1. Prerequisites**
- Ensure either `ufw` or `iptables` is installed and properly configured.
- Run the script with root privileges.

### **2. Setup**
1. Save the script to a file, e.g., `firewall_config.zsh`.
2. Make the script executable:
   ```zsh
   chmod +x firewall_config.zsh
   ```

### **3. Running the Script**
To start the interactive menu:
```zsh
sudo ./firewall_config.zsh
```

### **4. Interactive Menu**
- **Options**:
  - **Allow Traffic**: Enables traffic for a specified protocol and port.
  - **Deny Traffic**: Blocks traffic for a specified protocol and port.
  - **Exit**: Ends the script.
- **Example Usage**:
  - Allow TCP traffic on port 80 (HTTP):
    - Select "Allow Traffic."
    - Enter protocol: `tcp`
    - Enter port: `80`

---

## Sample Output

**Console Output**:
```
Firewall Configuration Script
Choose an action:
1) Allow Traffic
2) Deny Traffic
3) Exit
Enter protocol (tcp/udp): tcp
Enter port number: 80
Adding UFW rule: allow tcp on port 80
Rule added successfully.
```

---

## Future Improvements

### **1. Rule Listing**
- Add functionality to list existing rules for both `ufw` and `iptables`.

### **2. Logging**
- Implement logging for all actions to track changes made by the script.

### **3. IP-Based Rules**
- Enable rules for specific IP addresses or ranges.

### **4. Advanced Rule Management**
- Add support for rule priorities and custom chains in `iptables`.

---

## License
This script is provided "as is" without warranties. Use it at your own risk.

