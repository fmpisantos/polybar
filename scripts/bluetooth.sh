#!/bin/bash

if bluetoothctl show | grep -q "Powered: yes"; then
    connected=$(bluetoothctl info | grep -q "Connected: yes" && echo "yes" || echo "no")
    
    if [ "$connected" = "yes" ]; then
        device_name=$(bluetoothctl info | grep "Name:" | head -n1 | cut -d' ' -f2-)
        echo " $device_name"
    else
        echo " On"
    fi
else
    echo " Off"

fi
