#!/usr/bin/env bash
# Theme switcher for Hyprland, Kitty, Rofi, NVIM, Waybar, and Wlogout
set -e

SETTINGS="$HOME/dotfiles/global/settings.json"

# Read theme from JSON
THEME=$(jq -r '.theme' "$SETTINGS")

echo ">> Switching to theme: $THEME"

# Confirm current theme
if [ "$THEME" == "matugen" ]; then
  echo ":: Execute matugen with $HOME/dotfiles/global/current_wallpaper.png"
  matugen image "$HOME/dotfiles/global/current_wallpaper.png"
fi

link_theme() {
  local SRC=$1
  local DEST=$2
  local NAME=$3

  if [ -e "$SRC" ]; then
    ln -sf "$SRC" "$DEST"
    echo "$NAME theme linked."
  else
    echo "$NAME theme not found: $SRC"
  fi
}

### Hyprland
link_theme "$HOME/dotfiles/global/hypr-general/${THEME}.conf" \
            "$HOME/.config/hypr/conf/deco-general.conf" \
            "Hyprland"

### Kitty
link_theme "$HOME/.config/kitty/themes/${THEME}.conf" \
            "$HOME/.config/kitty/colors.conf" \
            "Kitty"

### Rofi
link_theme "$HOME/.config/rofi/themes/${THEME}.rasi" \
            "$HOME/.config/rofi/colors.rasi" \
            "Rofi"

### NVIM
link_theme "$HOME/.config/nvim/lua/themes/${THEME}.lua" \
            "$HOME/.config/nvim/lua/plugins/color-scheme.lua" \
            "NVIM"

### Waybar
WAYBAR_THEME=$(jq -r '.["waybar-theme"]' "$SETTINGS")
WAYBAR_FILE="$HOME/.config/waybar/themes/$THEME/$WAYBAR_THEME.css"
WAYBAR_DEST="$HOME/.config/waybar/colors.css"

if [ -f "$WAYBAR_FILE" ]; then
  ln -sf "$WAYBAR_FILE" "$WAYBAR_DEST"
  pkill waybar || true
  nohup waybar >/dev/null 2>&1 &
  echo "Waybar theme linked ($WAYBAR_THEME.css)."
else
  echo "Waybar theme not found: $WAYBAR_FILE"
fi

### Wlogout
link_theme "$HOME/.config/wlogout/themes/${THEME}.css" \
            "$HOME/.config/wlogout/colors.css" \
            "Wlogout"

echo ">> Theme switch complete."


notify-send -u low -i "🎨" "Theme Updated" "$THEME applied successfully."
