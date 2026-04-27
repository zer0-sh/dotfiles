#!/bin/bash
# Shows active window name or "Debian" if no window

ACTIVE_WINDOW=$(hyprctl activewindow -j 2>/dev/null | jq -r '.title' 2>/dev/null)

if [ -n "$ACTIVE_WINDOW" ] && [ "$ACTIVE_WINDOW" != "null" ] && [ -n "$ACTIVE_WINDOW" ]; then
    # Truncate to 20 chars
    echo "$ACTIVE_WINDOW" | cut -c1-20
else
    echo "Debian"
fi
