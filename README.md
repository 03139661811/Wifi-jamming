Here are the step-by-step instructions to run a Wi-Fi deauthentication attack using a script called `wifi_attack.sh` on a Paroot or Linux system:

### Step-by-Step Instructions

1. **Open a Root Terminal:**
   - On your Paroot or Linux system, open a terminal with root privileges. This can usually be done by searching for "terminal" in your applications menu and then running it as an administrator or root.

2. **Navigate to the Script's Folder:**
   - Use the `cd` command to change to the directory where your `wifi_attack.sh` script is located. For example, if your script is in the `Documents` folder, you would type:
     ```bash
     cd ~/Documents
     ```

3. **Make the Script Executable:**
   - Give execute permissions to the script by typing the following command:
     ```bash
     chmod +x wifi_attack.sh
     ```

4. **Run the Script:**
   - Execute the script by typing:
     ```bash
     ./wifi_attack.sh
     ```

5. **Select the Wi-Fi Adapter:**
   - The script will prompt you to select a Wi-Fi adapter. Copy the name of the desired adapter from the list provided by the script, paste it into the terminal, and press `Enter`.

6. **Enable Monitor Mode:**
   - The script will ask if you want to put the adapter in monitor mode. Type `Y` and press `Enter`.

7. **Enter Wi-Fi Network Details:**
   - The script will prompt you for the following details:
     - **ESSID (Network Name):** Enter the ESSID of the Wi-Fi network you want to attack and press `Enter`.
     - **Channel:** Enter the channel number of the Wi-Fi network and press `Enter`.
     - **BSSID (MAC Address):** Enter the BSSID of the Wi-Fi network and press `Enter`.

8. **Start the Attack:**
   - The attack will start automatically after you have entered all the required details. The script will continuously send deauthentication packets to the Wi-Fi network, disrupting the connection for all devices.

9. **Stop the Attack:**
   - To stop the attack, press `Ctrl+C` in the terminal where the script is running.

### Summary
- **Open Root Terminal**
- **Navigate to Script Folder:** `cd <folder-path>`
- **Make Script Executable:** `chmod +x wifi_attack.sh`
- **Run Script:** `./wifi_attack.sh`
- **Select Wi-Fi Adapter**
- **Enable Monitor Mode:** Type `Y` and press `Enter`
- **Enter Network Details:** ESSID, Channel, BSSID
- **Start Attack:** Attack starts automatically
- **Stop Attack:** Press `Ctrl+C`

This will initiate a deauthentication attack, preventing devices from connecting to the targeted Wi-Fi network until you manually stop the attack.
