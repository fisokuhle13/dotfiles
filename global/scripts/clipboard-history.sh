#!/usr/bin/env bash

# Clipboard history menu with rofi
# Requires: cliphist, rofi, wl-clipboard (or xclip on X11)

chosen=$(cliphist list | rofi -dmenu -i -p "Clipboard")

[ -n "$chosen" ] && cliphist decode <<<"$chosen" | wl-copy
