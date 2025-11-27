#!/bin/bash

active_iface=$(ip route show default | head -n1 | awk '{print $5}')

# Check if it's WiFi
if [[ "$active_iface" == wl* ]]; then
    wifi_essid=$(iwgetid -r 2>/dev/null)
    if [ -n "$wifi_essid" ]; then
        echo " $wifi_essid"
        exit 0
    fi
fi

if [[ "$active_iface" == e* ]]; then
    echo " Wired"
    exit 0
fi

echo " offline"
