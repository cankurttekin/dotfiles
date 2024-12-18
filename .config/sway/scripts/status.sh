#!/bin/bash

while true; do
    # BATTERY
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status)

    # Determine charging symbol
    if [[ "$BAT_STATUS" == "Charging" ]]; then
        CHARGING_SYMBOL="+"  # Charging symbol
    elif [[ "$BAT_STATUS" == "Discharging" ]]; then
	CHARGING_SYMBOL="-" # Discharging Symbol
    else
        CHARGING_SYMBOL=""  # Not charging and others
    fi

    # VOLUME
    VOL=$(wpctl status | grep -A 10 "Sinks" | grep "\* " | head -n 1 | awk -F'vol: ' '{print $2}' | awk '{print $1}' | sed 's/]*$//' | awk '{printf "%.0f", $1 * 100}')

    # WI-FI
    if command -v nmcli >/dev/null 2>&1; then
        # Using nmcli
        WIFI=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
	#WIFI=$(nmcli -t -f active,ssid dev wifi | grep 'yes' | cut -d':' -f2 | awk '{print substr($0,1,1)"..."substr($0,length($0)-3,4)}') # returns wifi name as a...aaaa
        if [ -z "$WIFI" ]; then
            WIFI="WIFI: Off"
        else
            WIFI="WIFI: $WIFI"
        fi
    elif command -v iwgetid >/dev/null 2>&1; then
        # Using iwgetid
        WIFI=$(iwgetid -r)
        if [ -z "$WIFI_" ]; then
            WIFI="WIFI: Off"
        else
            WIFI="WIFI: $WIFI"
        fi
    else
        WIFI="WIFI: Unknown"
    fi

    # BLUETOOTH
    if command -v bluetoothctl >/dev/null 2>&1; then
        BLUETOOTH_STATUS=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
        if [ "$BLUETOOTH_STATUS" == "yes" ]; then
            BLUETOOTH_STATUS="BT: " # BT: 1 / Bluetooth on
            BLUETOOTH_DEVICES=$(bluetoothctl devices Connected | awk '{print substr($0, index($0, $3))}' | paste -sd ',')
            #BLUETOOTH_DEVICES=$(bluetoothctl devices Connected | awk '{print $3}')
            if [ -z "$BLUETOOTH_DEVICES" ]; then
                #BLUETOOTH_DEVICES="No devices"
		BLUETOOTH_DEVICES="On"
            else
                BLUETOOTH_DEVICES="$BLUETOOTH_DEVICES"
            fi
        else
            BLUETOOTH_STATUS="BT: Off" # bluetooth off
            BLUETOOTH_DEVICES=""
        fi
    else
        BLUETOOTH_STATUS="BL: NULL"
        BLUETOOTH_DEVICES=""
    fi

    BRIGHTNESS=$(brightnessctl | awk -F '[()/%]' '{print $2}' | tr -d '\n')

    CPU_TEMP=$(sensors | grep -i 'Package id 0:' | awk '{print $4}' | sed 's/+//')
    
    POWER=$(sensors | grep -i 'power1:' | awk '{print $2}')
    
    # Get current date and time
    DATE_TIME=$(date +"%a, %b %e  %H:%M")
    
    # Output formatted string
    echo "POWER: $POWER W   CPU TEMP: $CPU_TEMP   BRIGHTNESS: $BRIGHTNESS   $BLUETOOTH_STATUS$BLUETOOTH_DEVICES   $WIFI   VOL: $VOL   BAT: $BAT%$CHARGING_SYMBOL   $DATE_TIME " | awk '{print $0}'
    # Update every 30 seconds
    sleep 30
done

