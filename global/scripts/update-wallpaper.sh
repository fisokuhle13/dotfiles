#!/usr/bin/env bash

# Update wallpaper to the last set for the theme when wallpaper changes
set -e



SETTINGS="$HOME/dotfiles/global/settings.json"

# Read theme from JSON
THEME=$(jq -r '.theme' "$SETTINGS")

# echo ">> Switching to theme: $THEME"

# Get the wallpaper path (returns empty string if missing or null)
WALLPAPER=$(jq -r --arg t "$THEME" '.wallpaper[$t] // empty' "$SETTINGS")

# ───────────────────────────────────────────────
# for testing / debugging
# ───────────────────────────────────────────────
# echo "$WALLPAPER"
#
# # Or more verbose:
# echo "Theme: $THEME"
# echo "Wallpaper path from JSON: $WALLPAPER"
#
if [ -z "$WALLPAPER" ]; then
    notify-send "Wallpaper not configured" \
          "No path found for theme '$THEME' in settings.json" \
          --urgency=normal \
          --icon=dialog-information \
          --expire-time=7000
    exit 1 
elif [ ! -f "$WALLPAPER" ]; then
notify-send "Wallpaper not found" \
        "The file was deleted or moved:\n\n$WALLPAPER" \
        --urgency=normal \
        --icon=dialog-warning \       
        --expire-time=8000
    exit 1 
else
    # echo "Wallpaper exists ✓ : $WALLPAPER"
    waypaper --wallpaper $WALLPAPER
fi
