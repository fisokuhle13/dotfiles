#!/bin/bash

DEST="$HOME/dotfiles/global/current_wallpaper.png"
WAYPAPER_CONFIG="$HOME/.config/waypaper/config.ini"

# Fallback: Read wallpaper from config.ini if $1 is empty
if [ -z "$1" ]; then
  WALLPAPER=$(grep '^wallpaper =' "$WAYPAPER_CONFIG" | cut -d'=' -f2- | sed 's/^ *//; s/ *$//')
  WALLPAPER=$(eval echo "$WALLPAPER") # Expand ~ to $HOME
else
  WALLPAPER="$1"
fi

# Ensure the global directory exists
mkdir -p "$HOME/dotfiles/global"

# Remove the old wallpaper if it exists
[ -f "$DEST" ] && rm "$DEST"

# Convert to PNG if not already PNG
EXT="${WALLPAPER##*.}"
if [ "$EXT" != "png" ]; then
  magick convert "$WALLPAPER" "$DEST"
else
  cp "$WALLPAPER" "$DEST"
fi

# Change colors if the theme is matugen
SETTINGS="$HOME/dotfiles/global/settings.json"

# Read theme from JSON
THEME=$(jq -r '.theme' "$SETTINGS")

if [ "$THEME" == "matugen" ]; then
  echo ":: Execute matugen with $HOME/dotfiles/global/current_wallpaper.png"

  # Call theme-switcher (matugen will be reloaded there)
  "$HOME/dotfiles/global/scripts/theme-switcher.sh"
fi

# Verify copy
if [ -f "$DEST" ]; then
  echo "Wallpaper converted/copied to $DEST"
else
  echo "Failed to convert/copy wallpaper to $DEST" >&2
  exit 1
fi
