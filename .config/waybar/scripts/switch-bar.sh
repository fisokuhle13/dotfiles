#!/bin/bash

# Directories
BARS_DIR="$HOME/.config/waybar/bars"
TARGET="$HOME/.config/waybar/style.css"

# Icon for rofi menu
ICON="󰕷   " # Nerd Font bar icon

# Collect bar styles
bars=($(ls "$BARS_DIR"/*.css 2>/dev/null | xargs -n1 basename))

# Exit if no styles found
[ ${#bars[@]} -eq 0 ] && echo "No styles found in $BARS_DIR" && exit 1

# Build rofi menu
menu=""
for b in "${bars[@]}"; do
  menu+="$ICON$b\n"
done

# Show menu
choice=$(echo -e "$menu" | rofi -dmenu -i -p "Select Bar Style")

# Exit if nothing picked
[ -z "$choice" ] && exit 0

# Strip icon
choice_file=$(echo "$choice" | sed "s/^$ICON//")

# Copy chosen style to target
ln -sf "$BARS_DIR/$choice_file" "$TARGET"

echo "Switched bar style to: $(basename "$choice_file" .css)"

# Restart waybar
pkill waybar
nohup waybar >/dev/null 2>&1 &
