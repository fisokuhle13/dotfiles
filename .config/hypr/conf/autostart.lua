-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("waypaper --restore")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
    -- Load cliphist history
    hl.exec_cmd("wl-paste --watch cliphist store")

    -- Github
    hl.exec_cmd("~/.config/hypr/scripts/github.sh")

    -- Load GTK settings
    hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")
end)
