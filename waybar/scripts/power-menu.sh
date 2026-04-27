#!/bin/bash
# Power Menu for Waybar - Hyprland
# Displays a menu with shutdown, reboot, reload, and lock options

# Options
options="Shutdown\nReboot\nReload Hyprland\nLock"

# Launch menu using wofi (or fallback to tofi/rofi)
if command -v wofi &> /dev/null; then
    choice=$(echo -e "$options" | wofi --dmenu --prompt "Power Menu" --layer shell)
elif command -v tofi &> /dev/null; then
    choice=$(echo -e "$options" | tofi --prompt "Power> ")
elif command -v rofi &> /dev/null; then
    choice=$(echo -e "$options" | rofi -dmenu -p "Power Menu")
else
    # Fallback: direct execution via notification
    notify-send "Power Menu" "No launcher found. Install wofi, tofi, or rofi."
    exit 1
fi

# Execute choice
case $choice in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    "Reload Hyprland")
        hyprctl reload
        ;;
    Lock)
        # Try common lockers
        if command -v hyprlock &> /dev/null; then
            hyprlock
        elif command -v swaylock &> /dev/null; then
            swaylock
        elif command -v loginctl &> /dev/null; then
            loginctl lock-session
        else
            notify-send "Lock" "No screen locker found"
        fi
        ;;
esac
