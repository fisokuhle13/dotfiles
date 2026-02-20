#!/usr/bin/env bash
# set-waypaper-theme-directory.sh
# Sets waypaper's default "folder" in config.ini to ~/wallpaper/$THEME (or fallback)
# → uses "directory" wording everywhere in output & variables, but keeps real key = "folder"

set -euo pipefail

SETTINGS="$HOME/dotfiles/global/settings.json"
CONFIG_FILE="$HOME/.config/waypaper/config.ini"
BASE_WALLPAPER_DIR="$HOME/wallpaper"

# ────────────────────────────────────────────────
#  Read theme
# ────────────────────────────────────────────────
if [[ ! -f "$SETTINGS" ]]; then
    echo "Error: settings.json not found → $SETTINGS" >&2
    notify-send -u critical "Waypaper theme directory" "settings.json not found"
    exit 1
fi

THEME=$(jq -r '.theme // "default"' "$SETTINGS")

if [[ -z "$THEME" || "$THEME" == "null" ]]; then
    THEME="default"
fi

# ────────────────────────────────────────────────
# Build desired path
# ────────────────────────────────────────────────
DESIRED_DIR="$BASE_WALLPAPER_DIR/$THEME"

# ────────────────────────────────────────────────
#  Decide final directory + prepare message
# ────────────────────────────────────────────────
if [[ -d "$DESIRED_DIR" ]]; then
    FINAL_DIR="$DESIRED_DIR"
    MSG="Set waypaper directory to theme: $THEME"
    ICON="dialog-information"
else
    FINAL_DIR="$BASE_WALLPAPER_DIR"
    MSG="Theme directory does NOT exist:\n$DESIRED_DIR\n\nFalling back to:\n$FINAL_DIR"
    ICON="dialog-warning"
    notify-send -u normal -i "$ICON" "Waypaper theme directory" "$MSG"
fi

# ────────────────────────────────────────────────
# 4. Update config.ini (key MUST be "folder =", not "dir")
# ────────────────────────────────────────────────
if [[ ! -f "$CONFIG_FILE" ]]; then
    # Very first run — create minimal config
    mkdir -p "$(dirname "$CONFIG_FILE")"
    cat > "$CONFIG_FILE" <<EOF
[Settings]
folder = $FINAL_DIR
EOF
    echo "Created new config with folder = $FINAL_DIR"
else
    # Replace any existing folder= line(s), or add if missing
    if grep -qE "^folder\s*=" "$CONFIG_FILE"; then
        sed -i "s|^folder\s*=.*|folder = $FINAL_DIR|" "$CONFIG_FILE"
    else
        # Append under [Settings] or create section at end
        if grep -q "\[Settings\]" "$CONFIG_FILE"; then
            sed -i "/^\[Settings\]/a folder = $FINAL_DIR" "$CONFIG_FILE"
        else
            echo -e "\n[Settings]\nfolder = $FINAL_DIR" >> "$CONFIG_FILE"
        fi
    fi
fi

# echo "Updated waypaper config → folder = $FINAL_DIR"
# notify-send -u low -i "$ICON" "Waypaper directory updated" \
#     "Now using:\n$FINAL_DIR\n\n$MSG"

exit 0
