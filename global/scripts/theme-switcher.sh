#!/usr/bin/env bash
# Theme switcher for Hyprland, Kitty, Rofi, and Waybar

set -e

SETTINGS="$HOME/dotfiles/global/settings.json"

# Read theme from JSON
THEME=$(jq -r '.theme' "$SETTINGS")

echo ">> Switching to theme: $THEME"

# Confirm current theme
if [ "$THEME" == "matugen" ]; then
  echo ":: Execute matugen with $HOME/dotfiles/global/current_wallpaper.png"
  $HOME/.cargo/bin/matugen image $HOME/dotfiles/global/current_wallpaper.png
fi

### Hyprland
HYPR_SRC="$HOME/dotfiles/global/hypr-general/${THEME}.conf"
HYPR_DEST="$HOME/.config/hypr/conf/deco-general.conf"

if [ -f "$HYPR_SRC" ]; then
  cp "$HYPR_SRC" "$HYPR_DEST"
  echo "Hyprland theme applied."
else
  echo "Hyprland theme not found: $HYPR_SRC"
fi

### Kitty
KITTY_SRC="$HOME/.config/kitty/themes/${THEME}.conf"
KITTY_DEST="$HOME/.config/kitty/colors.conf"

if [ -f "$KITTY_SRC" ]; then
  cp "$KITTY_SRC" "$KITTY_DEST"
  echo "Kitty theme applied."
else
  echo "Kitty theme not found: $KITTY_SRC"
fi

### Rofi
ROFI_SRC="$HOME/.config/rofi/themes/${THEME}.rasi"
ROFI_DEST="$HOME/.config/rofi/theme.rasi"

if [ -f "$ROFI_SRC" ]; then
  cp "$ROFI_SRC" "$ROFI_DEST"
  echo "Rofi theme applied."
else
  echo "Rofi theme not found: $ROFI_SRC"
fi

### NVIM
NVIM_SRC="$HOME/.config/nvim/lua/themes/${THEME}.lua"
NVIM_DEST="$HOME/.config/nvim/lua/plugins/color-scheme.lua"

if [ -f "$NVIM_SRC" ]; then
  cp "$NVIM_SRC" "$NVIM_DEST"
  echo "NVIM theme applied."
else
  echo "NVIM theme not found: $NVIM_SRC"
fi

### Waybar
WAYBAR_THEME=$(jq -r '.["waybar-theme"]' "$SETTINGS")
WAYBAR_SRC_DIR="$HOME/.config/waybar/themes/$THEME"
WAYBAR_DEST="$HOME/.config/waybar/colors.css"

if [ -d "$WAYBAR_SRC_DIR" ]; then
  WAYBAR_FILE="$WAYBAR_SRC_DIR/$WAYBAR_THEME.css"
  if [ -f "$WAYBAR_FILE" ]; then
    cp "$WAYBAR_FILE" "$WAYBAR_DEST"
    pkill waybar
    nohup waybar >/dev/null 2>&1 &
    echo "Waybar theme applied ($WAYBAR_THEME.css)."
  else
    echo "Waybar theme file not found: $WAYBAR_FILE"
  fi
else
  echo "Waybar theme folder not found: $WAYBAR_SRC_DIR"
fi

### Wlogout

WLOGOUT_SRC="$HOME/.config/wlogout/themes/${THEME}.css"
WLOGOUT_DEST="$HOME/.config/wlogout/colors.css"

if [ -f "$WLOGOUT_SRC" ]; then
  cp "$WLOGOUT_SRC" "$WLOGOUT_DEST"
  echo "WLOGOUT theme applied."
else
  echo "WLOGOUT theme not found: $WLOGOUT_SRC"
fi

echo ">> Theme switch complete."
