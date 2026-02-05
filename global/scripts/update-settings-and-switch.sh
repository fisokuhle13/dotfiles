#!/usr/bin/env bash
SETTINGS="$HOME/dotfiles/global/settings.json"
HYPR_DIR="$HOME/dotfiles/global/hypr-general"
ICON="󰨇 " # fixed Nerd Font paint palette icon

# List themes
themes=($(ls "$HYPR_DIR"/*.conf 2>/dev/null | xargs -n1 basename | sed 's/\.conf$//'))

# Add icon for display
themes_with_icons=()
for t in "${themes[@]}"; do
  themes_with_icons+=("$ICON$t")
done

# Rofi menu
choice=$(printf "%s\n" "${themes_with_icons[@]}" | rofi -dmenu -i -p "Theme:")
[ -z "$choice" ] && exit 0

# Strip icon to get the actual theme name
choice_name=$(echo "$choice" | sed "s/^$ICON//")

# Update settings.json theme key
jq --arg theme "$choice_name" '.theme = $theme' "$SETTINGS" >"$SETTINGS.tmp" && mv "$SETTINGS.tmp" "$SETTINGS"
echo "Updated settings.json with theme: $choice_name"

# Call theme-switcher
"$HOME/dotfiles/global/scripts/theme-switcher.sh"
