#!/bin/bash

if command -v playerctl &> /dev/null; then
    STATUS=$(playerctl status 2>/dev/null)
    if [ "$STATUS" = "Playing" ]; then
        TITLE=$(playerctl metadata title 2>/dev/null | cut -c1-25)
        if [ -n "$TITLE" ]; then
            echo " 󰎆 ${TITLE}"
        fi
    fi
fi