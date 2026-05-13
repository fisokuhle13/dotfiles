-------------------------------
---- WINDOWS / WORKSPACES ----
-------------------------------

-- Global behavior rules
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "hyprland-run-move",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})

-------------------
-- FLOAT APPS
-------------------

local function float_app(name, opts)
    opts = opts or {}
    hl.window_rule({
        name = name,
        match = { class = opts.class },
        float = true,
        size = opts.size,
        center = opts.center,
        pin = opts.pin,
        move = opts.move,
    })
end

-- Pavucontrol
float_app("pavucontrol", {
    class = "^org%.pulseaudio%.pavucontrol$",
    size = "700 600",
    center = true,
    pin = true,
})

-- Waypaper
float_app("waypaper", {
    class = "^waypaper$",
    size = "700 600",
    center = true,
    pin = true,
})

-- Blueman
float_app("blueman", {
    class = "^blueman%-manager$",
    size = "800 600",
    center = true,
})

-- nwg-look
float_app("nwg-look", {
    class = "^nwg%-look$",
    size = "700 600",
    move = "10% 20%",
    pin = true,
})

-- Mission Center
float_app("missioncenter", {
    class = "^io%.missioncenter%.MissionCenter$",
    size = "900 600",
    center = true,
    pin = true,
})

hl.window_rule({
    name = "missioncenter-preferences",
    match = {
        class = "^missioncenter$",
        title = "^Preferences$",
    },
    float = true,
})

-- Calculator
float_app("calculator", {
    class = "^org%.gnome%.Calculator$",
    size = "700 600",
    center = true,
})

-- Calendar
float_app("calendar", {
    class = "^org%.gnome%.Calendar$",
    size = "800 800",
    center = true,
})

-- Share picker
float_app("share-picker", {
    class = "^hyprland%-share%-picker$",
    size = "600 400",
    center = true,
    pin = true,
})

-- Generic floating apps
float_app("dotfiles-floating", {
    class = "^dotfiles%-floating$",
    size = "900 650",
    center = true,
})

-------------------
-- VISUAL RULES
-------------------

hl.window_rule({
    name = "evince-opacity",
    match = { class = "^org%.gnome%.Evince$" },
    opacity = "1 1",
})

hl.window_rule({
    name = "obsidian-opacity",
    match = { class = "^obsidian$" },
    opacity = "0.9 0.9",
})

-------------------
-- ENVIRONMENT
-------------------

-- Desktop identity
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- GTK / GDK
hl.env("GDK_SCALE", "1")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")

-- Mozilla / Electron / Ozone
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- Cursor
hl.env("XCURSOR_SIZE", "24")
