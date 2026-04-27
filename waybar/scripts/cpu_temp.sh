#!/bin/bash

CACHE_FILE="/tmp/waybar_cpu_state"

if [ ! -f "$CACHE_FILE" ]; then
    echo "temp" > "$CACHE_FILE"
fi

STATE=$(cat "$CACHE_FILE")

if [ "$STATE" = "temp" ]; then
    if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
        TEMP=$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))
        echo "󰔏 ${TEMP}°C"
    elif command -v sensors &> /dev/null; then
        TEMP=$(sensors | grep "Package id 0" | awk '{print int($4)}')
        echo "󰔏 ${TEMP}°C"
    else
        echo "󰔏 N/A"
    fi
else
    if command -v top &> /dev/null; then
        USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')
        echo "󰻠 ${USAGE}%"
    else
        echo "󰻠 N/A"
    fi
fi