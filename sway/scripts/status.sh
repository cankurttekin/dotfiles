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
        if [ -z "$WIFI" ]; then
            WIFI="WIFI: 0"
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
		BLUETOOTH_DEVICES="1"
            else
                BLUETOOTH_DEVICES="$BLUETOOTH_DEVICES"
            fi
        else
            BLUETOOTH_STATUS="BT: 0" # bluetooth off
            BLUETOOTH_DEVICES=""
        fi
    else
        BLUETOOTH_STATUS="BL: NULL"
        BLUETOOTH_DEVICES=""
    fi

    # Get current date and time
    DATE_TIME=$(date +"%a %b %e  %H:%M")

    # Output formatted string
    echo "$BLUETOOTH_STATUS$BLUETOOTH_DEVICES  $WIFI  VOL: $VOL  BAT: $BAT%$CHARGING_SYMBOL  $DATE_TIME " | awk '{print $0}'
    # Update every 30 seconds
    sleep 30
done

