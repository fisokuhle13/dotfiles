#!/bin/bash

# GTK / theme settings
config="$HOME/.config/gtk-3.0/settings.ini"
gnome_schema="org.gnome.desktop.interface"

# Terminal preference
terminal="kitty"

# Read GTK theme & dark preference from settings.ini
gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
prefer_dark_theme="$(grep 'gtk-application-prefer-dark-theme' "$config" | sed 's/.*\s*=\s*//')"

if [ "$prefer_dark_theme" == "0" ]; then
  prefer_dark_theme_value="prefer-light"
else
  prefer_dark_theme_value="prefer-dark"
fi

# Apply GTK settings globally
gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
gsettings set "$gnome_schema" icon-theme "Papirus"
gsettings set "$gnome_schema" color-scheme "$prefer_dark_theme_value"

# Set default terminal for GTK apps
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal "$terminal"
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal use-generic-terminal-name "true"
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings "<Ctrl><Alt>t"
