#!/bin/bash

TITLE=$(hyprctl activewindow -j 2>/dev/null | jq -r '.title' 2>/dev/null)

if [ -z "$TITLE" ] || [ "$TITLE" = "null" ]; then
    printf "%-20s" "Memento Mori"
else
    printf "%-20s" "$(echo "$TITLE" | cut -c1-20)"
fi