#!/bin/bash

SETTINGS="$HOME/dotfiles/global/settings.json"
THEME=$(jq -r '.theme' "$SETTINGS")

THEME_DIR="$HOME/.config/waybar/themes/$THEME"
TARGET="$HOME/.config/waybar/colors.css"
ICON="   " # Nerd Font paint palette

# Function to set config value
set_config() {
  local key="$1"
  local value="$2"
  jq --arg val "$value" --arg key "$key" '.[$key] = $val' "$SETTINGS" >tmp.json && mv tmp.json "$SETTINGS"
}

# 1. Collect themes inside the active theme folder
themes=($(ls "$THEME_DIR"/*.css 2>/dev/null | xargs -n1 basename))

# Exit if no themes found
[ ${#themes[@]} -eq 0 ] && echo "No themes found in $THEME_DIR" && exit 1

# 2. Build menu with same icon
menu=""
for t in "${themes[@]}"; do
  menu+="$ICON$t\n"
done

# 3. Show menu
choice=$(echo -e "$menu" | rofi -dmenu -i -p "Waybar Theme ($THEME)")

# Exit if nothing picked
[ -z "$choice" ] && exit 0

# 4. Strip icon to get filename
choice_file=$(echo "$choice" | sed "s/^$ICON//")

# 5. Extract theme name without .css extension for settings
theme_name=$(basename "$choice_file" .css)

# 6. Copy and restart waybar
cp "$THEME_DIR/$choice_file" "$TARGET"

# 7. Update settings.json with just the theme name (without .css)
set_config "waybar-theme" "$theme_name"

echo "Updated waybar theme to: $theme_name"

# 8. Restart waybar
pkill waybar
nohup waybar >/dev/null 2>&1 &
