# Script to send a notification when charger is plugged and unplugged
#!/bin/bash
prev_status="disconnected"

while true; do
    status=$(cat /sys/class/power_supply/AC0/online)
    if [ $status -eq 1 ] && [ $prev_status = "disconnected" ]; then
        notify-send -u low -i battery-full-charging "Battery status" "Charging cable is now plugged."

prev_status="connected"
    elif [ $status -eq 0 ] && [ $prev_status = "connected" ]; then
        notify-send -u low -i battery-missing "Battery status" "Charging cable has been unplugged."
        prev_status="disconnected"
    fi
    sleep 1
done
