#!/bin/bash
# Get backlight brightness percentage

if command -v brightnessctl &> /dev/null; then
    brightnessctl -m | cut -d',' -f4 | tr -d '%'
else
    echo "N/A"
fi
