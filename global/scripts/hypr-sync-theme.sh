#!/usr/bin/env bash

SETTINGS="$HOME/dotfiles/global/settings.json"
TARGET="$HOME/.config/hypr/conf/deco-general.conf"

jq -r '
  .hypr.general
  | "general {\n" +
    (
      to_entries[]
      | "    " + .key + " = " +
        (if (.value|type) == "string" then .value else tostring end)
    | join("\n")
    ) +
  "\n}"
' "$SETTINGS" | sed 's/^    \([^=]*\) = "\(.*\)"$/    \1 = \2/' >"$TARGET"

# Reload Hyprland
hyprctl reload
