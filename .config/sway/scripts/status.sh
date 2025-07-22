#!/bin/bash

while true; do
        # BATTERY
        BAT=$(cat /sys/class/power_supply/BAT0/capacity)
        BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status)
        CHARGING_SYMBOL=""
        [ "$BAT_STATUS" == "Charging" ] && CHARGING_SYMBOL="+"
        [ "$BAT_STATUS" == "Discharging" ] && CHARGING_SYMBOL="-"

    # VOLUME
    VOL=$(wpctl status | grep -A 10 "Sinks" | grep "\* " | head -n 1 | awk -F'vol: ' '{print $2}' | awk '{print $1}' | sed 's/]*$//' | awk '{printf "%.0f", $1 * 100}')

    # NETWORK: Wi-Fi + Ethernet + IP
    WIFI_INFO="WLAN: Off"
    ETH_INFO=""
    IP_ADDR="IP: N/A"

    if command -v nmcli >/dev/null 2>&1; then
            CONNECTIONS=$(nmcli -t -f TYPE,STATE,DEVICE,CONNECTION dev | grep ':connected')
            while IFS= read -r LINE; do
                    TYPE=$(echo "$LINE" | cut -d: -f1)
                    DEVICE=$(echo "$LINE" | cut -d: -f3)
                    NAME=$(echo "$LINE" | cut -d: -f4)

                    if [ "$TYPE" = "wifi" ]; then
                            SIGNAL=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^\*' | cut -d: -f2)
                            SPEED=$(iw dev "$DEVICE" link | grep -oP 'tx bitrate: \K[^\s]+')
                            [ -n "$SPEED" ] && SPEED="${SPEED}Mbps"
                            WIFI_INFO="WLAN: $NAME ($SIGNAL%)${SPEED:+ $SPEED}"

                # Get IP address for Wi-Fi
                IP=$(ip -4 addr show "$DEVICE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
                [ -n "$IP" ] && IP_ADDR="IP: $IP"
        elif [ "$TYPE" = "ethernet" ]; then
                ETH_STATUS=$(cat /sys/class/net/"$DEVICE"/operstate 2>/dev/null)
                ETH_SPEED=$(cat /sys/class/net/"$DEVICE"/speed 2>/dev/null)
                if [ "$ETH_STATUS" = "up" ]; then
                        ETH_INFO="ETH: Up${ETH_SPEED:+ ${ETH_SPEED}Mbps}"

                    # Get IP address for Ethernet
                    IP=$(ip -4 addr show "$DEVICE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
                    [ -n "$IP" ] && IP_ADDR="IP: $IP"
            else
                    ETH_INFO="ETH: Down"
                fi
                    fi
            done <<< "$CONNECTIONS"
            [ -z "$ETH_INFO" ] && ETH_INFO="ETH: Down"
    else
            WIFI_INFO="WLAN: Unknown"
            ETH_INFO="ETH: Unknown"
    fi

    NETWORK="$WIFI_INFO   $ETH_INFO   $IP_ADDR"

# BLUETOOTH
if command -v bluetoothctl >/dev/null 2>&1; then
        BLUETOOTH_POWERED=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
        if [ "$BLUETOOTH_POWERED" == "yes" ]; then
                BLUETOOTH_STATUS="BT: "
                CONNECTED_MACS=$(bluetoothctl devices | awk '{print $2}')
                CONNECTED_NAMES=()

                for MAC in $CONNECTED_MACS; do
                        if bluetoothctl info "$MAC" | grep -q "Connected: yes"; then
                                NAME=$(bluetoothctl info "$MAC" | grep "Name:" | cut -d ' ' -f2-)
                                CONNECTED_NAMES+=("$NAME")
                        fi
                done

                if [ ${#CONNECTED_NAMES[@]} -eq 0 ]; then
                        BLUETOOTH_DEVICES="On"
                else
                        BLUETOOTH_DEVICES=$(IFS=, ; echo "${CONNECTED_NAMES[*]}")
                fi
        else
                BLUETOOTH_STATUS="BT: Off"
                BLUETOOTH_DEVICES=""
        fi
else
        BLUETOOTH_STATUS="BT: NULL"
        BLUETOOTH_DEVICES=""
fi

    # DATE & TIME
    DATE_TIME=$(date +"%a, %b %e  %H:%M")

    echo "$BLUETOOTH_STATUS$BLUETOOTH_DEVICES   $NETWORK   VOL: $VOL   BAT: $BAT%$CHARGING_SYMBOL   $DATE_TIME "

    sleep 60
done
