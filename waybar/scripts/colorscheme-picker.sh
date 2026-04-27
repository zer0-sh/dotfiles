#!/bin/bash
# Color Scheme Picker for Waybar
# Allows selecting different color themes

COLORSCHEMES_DIR="$HOME/.config/waybar/colorschemes"

# Create colorschemes directory if it doesn't exist
mkdir -p "$COLORSCHEMES_DIR"

# Default color scheme (Catppuccin Mocha)
DEFAULT_SCHEME="$COLORSCHEMES_DIR/catppuccin-mocha.css"

# Create default scheme if it doesn't exist
if [ ! -f "$DEFAULT_SCHEME" ]; then
    cat > "$DEFAULT_SCHEME" << 'EOF'
/* Catppuccin Mocha - Default */
* {
  color: #cdd6f4;
}

window#waybar {
  color: #cdd6f4;
}

#custom-debian {
  color: #f38ba8;
}

#workspaces button.active {
  color: #89b4fa;
}

#hyprland-window {
  color: #a6e3a1;
}

#custom-linux {
  color: #89b4fa;
}

#network {
  color: #f9e2af;
}

#bluetooth {
  color: #89b4fa;
}

#battery {
  color: #a6e3a1;
}

#pulseaudio {
  color: #f5c2e7;
}

#cpu {
  color: #fab387;
}

#temperature {
  color: #f9e2af;
}

#clock {
  color: #cba6f7;
}

#custom-power {
  color: #f38ba8;
}

#custom-colorschemas {
  color: #f5c2e7;
}
EOF
fi

# List available color schemes
schemes=$(ls "$COLORSCHEMES_DIR"/*.css 2>/dev/null | xargs -I {} basename {} .css)

if [ -z "$schemes" ]; then
    notify-send "Color Schemes" "No color schemes found in $COLORSCHEMES_DIR"
    exit 1
fi

# Launch picker
if command -v wofi &> /dev/null; then
    choice=$(echo "$schemes" | wofi --dmenu --prompt "Color Scheme" --layer shell)
elif command -v tofi &> /dev/null; then
    choice=$(echo "$schemes" | tofi --prompt "Scheme> ")
elif command -v rofi &> /dev/null; then
    choice=$(echo "$schemes" | rofi -dmenu -p "Color Scheme")
else
    notify-send "Color Scheme Picker" "No launcher found. Install wofi, tofi, or rofi."
    exit 1
fi

if [ -z "$choice" ]; then
    exit 0
fi

# Apply selected scheme
selected_file="$COLORSCHEMES_DIR/$choice.css"

if [ -f "$selected_file" ]; then
    # Copy to main style.css (backup first)
    cp "$HOME/.config/waybar/style.css" "$HOME/.config/waybar/style.css.bak"
    cp "$selected_file" "$HOME/.config/waybar/style.css"

    # Reload waybar
    killall -SIGUSR2 waybar 2>/dev/null || pkill -SIGUSR2 waybar 2>/dev/null || true

    notify-send "Color Scheme Applied" "Switched to: $choice"
else
    notify-send "Error" "Color scheme file not found: $selected_file"
fi
