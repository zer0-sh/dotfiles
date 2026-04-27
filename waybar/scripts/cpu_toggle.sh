#!/bin/bash

CACHE_FILE="/tmp/waybar_cpu_state"

if [ -f "$CACHE_FILE" ]; then
    STATE=$(cat "$CACHE_FILE")
    if [ "$STATE" = "temp" ]; then
        echo "usage" > "$CACHE_FILE"
    else
        echo "temp" > "$CACHE_FILE"
    fi
else
    echo "usage" > "$CACHE_FILE"
fi