# README: Simple RF Frequency Scanner

## **Overview**
The **Simple RF Frequency Scanner** is a Zsh-based script that uses an RTL-SDR device and the `rtl_power` tool to scan a specified RF frequency range. It outputs a CSV file with details about the scanned frequencies and signal strengths, making it a versatile tool for exploring and analyzing the radio frequency spectrum.

---

## **What the Script Does**
1. **Scans a Defined Frequency Range**:
   - Allows users to specify a start frequency, stop frequency, and step size.
   - Example: Scanning the FM radio band (88–108 MHz).
2. **Generates a CSV Output**:
   - Saves the scan results, including time, frequency, and signal strength, to a CSV file.
3. **Summarizes Results**:
   - Optionally displays the first 10 rows of the scan results directly in the terminal.

---

## **Prerequisites**

### **1. RTL-SDR Hardware**
- An RTL-SDR dongle is required for scanning RF frequencies.

### **2. RTL-SDR Tools**
- The script uses the `rtl_power` tool from the RTL-SDR suite.
- Install the tools:
  - On **Debian/Ubuntu**:
    ```bash
    sudo apt install rtl-sdr
    ```
  - On **Red Hat/CentOS**:
    ```bash
    sudo yum install rtl-sdr
    ```

### **3. Compatible System**
- The script is designed for Linux systems with Zsh as the shell.

---

## **How to Use**

1. **Connect Your RTL-SDR Device**:
   - Plug the RTL-SDR dongle into a USB port.

2. **Edit Scanning Parameters (Optional)**:
   - Modify the script to adjust frequency ranges and step sizes:
     ```zsh
     START_FREQ=88e6      # Start frequency (e.g., 88 MHz)
     STOP_FREQ=108e6      # Stop frequency (e.g., 108 MHz)
     STEP_SIZE=100k       # Step size (e.g., 100 kHz)
     ```

3. **Run the Script**:
   - Make the script executable:
     ```bash
     chmod +x rf_scanner.zsh
     ```
   - Run the script:
     ```bash
     ./rf_scanner.zsh
     ```

4. **View the Results**:
   - The scan results are saved in `rf_scan_results.csv`.
   - A summary of the results is displayed in the terminal.

---

## **Sample Output**

### **Console Output**:
```
Starting RF frequency scan from 88000000 Hz to 108000000 Hz...
RF frequency scan complete.
Results saved to rf_scan_results.csv.
Summary of scan results:
2018-08-09T12:00:00 88000000 -45.3
2018-08-09T12:00:01 88000100 -50.1
2018-08-09T12:00:02 88000200 -47.5
```

### **CSV File (`rf_scan_results.csv`)**:
```
2018-08-09T12:00:00,88000000,-45.3
2018-08-09T12:00:01,88000100,-50.1
2018-08-09T12:00:02,88000200,-47.5
```

---

## **Key Features**

### **1. Flexible Frequency Range**
- Customize the start and stop frequencies as well as the step size to target specific RF bands.

### **2. Summarized Results**
- Provides a quick overview of the scan results in the terminal.

### **3. CSV Export**
- Saves detailed results in a CSV file for further analysis or visualization.

---

## **Real-Life Use Cases**

1. **Identifying Signal Sources**:
   - Detect active signals in a specific frequency range, such as FM radio stations or amateur radio bands.

2. **Wireless Network Analysis**:
   - Scan Wi-Fi, Bluetooth, or other ISM bands for activity and interference.

3. **Spectrum Monitoring**:
   - Analyze the RF spectrum to identify unused or overcrowded frequencies.

4. **Educational and Research Applications**:
   - Teach RF concepts or conduct research on signal strength and spectrum use.

5. **Hobbyist Exploration**:
   - Experiment with scanning various frequency ranges, including public safety, maritime, or CB radio bands.

---

## **Troubleshooting**

1. **`rtl_power` Not Found**:
   - Ensure RTL-SDR tools are installed. Reinstall if necessary:
     ```bash
     sudo apt install rtl-sdr
     ```

2. **No Output from the Scan**:
   - Verify the RTL-SDR dongle is properly connected and recognized by the system:
     ```bash
     rtl_test
     ```

3. **Permissions Issues**:
   - Run the script with elevated privileges if required:
     ```bash
     sudo ./rf_scanner.zsh
     ```

---

## **Potential Enhancements**

1. **Real-Time Visualization**:
   - Integrate with tools like `gnuplot` or `matplotlib` to display RF spectra in real-time.

2. **Power Thresholds**:
   - Filter results to highlight frequencies with strong signals.

3. **Advanced Scheduling**:
   - Use `cron` to automate periodic scans for long-term spectrum analysis.

---

## **License**
This script is provided "as-is" for educational and personal use. The user assumes all responsibility for ensuring compliance with local regulations regarding RF spectrum scanning.

