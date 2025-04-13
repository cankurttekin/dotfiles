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

    # NETWORK: Wi-Fi + Ethernet
    WIFI_INFO=""
    ETH_INFO=""
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
                WIFI_INFO="Wi-Fi: $NAME ($SIGNAL%)${SPEED:+ $SPEED}"
            elif [ "$TYPE" = "ethernet" ]; then
                ETH_STATUS=$(cat /sys/class/net/"$DEVICE"/operstate 2>/dev/null)
                ETH_SPEED=$(cat /sys/class/net/"$DEVICE"/speed 2>/dev/null)
                [ "$ETH_STATUS" = "up" ] && ETH_INFO="ETH: Up${ETH_SPEED:+ ${ETH_SPEED}Mbps}" || ETH_INFO="ETH: Down"
            fi
        done <<< "$CONNECTIONS"

        [ -z "$WIFI_INFO" ] && [ -z "$ETH_INFO" ] && NETWORK="NET: Disconnected" || NETWORK="$WIFI_INFO   $ETH_INFO"
    else
        NETWORK="NET: Unknown"
    fi

    # BLUETOOTH
    if command -v bluetoothctl >/dev/null 2>&1; then
        BLUETOOTH_STATUS=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
        if [ "$BLUETOOTH_STATUS" == "yes" ]; then
            BLUETOOTH_STATUS="BT: "
            BLUETOOTH_DEVICES=$(bluetoothctl devices Connected | awk '{print substr($0, index($0, $3))}' | paste -sd ',')
            [ -z "$BLUETOOTH_DEVICES" ] && BLUETOOTH_DEVICES="On"
        else
            BLUETOOTH_STATUS="BT: Off"
            BLUETOOTH_DEVICES=""
        fi
    else
        BLUETOOTH_STATUS="BL: NULL"
        BLUETOOTH_DEVICES=""
    fi

    # DATE & TIME
    DATE_TIME=$(date +"%a, %b %e  %H:%M")

    echo "$BLUETOOTH_STATUS$BLUETOOTH_DEVICES   $NETWORK   VOL: $VOL   BAT: $BAT%$CHARGING_SYMBOL   $DATE_TIME"

    sleep 30
done

