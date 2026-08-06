-------------------------------
---- WINDOWS / WORKSPACES ----
-------------------------------

local function float_app(name, opts)
    opts = opts or {}
    hl.window_rule({
        name = name,
        match = { class = opts.class or ".*" },
        float = true,
        size = opts.size,
        center = opts.center,
        pin = opts.pin,
        move = opts.move,
    })
end

-- Pavucontrol
float_app("pavucontrol", {
    class = "^org\\.pulseaudio\\.pavucontrol$",
    size = { 700, 600 },
    center = true,
    pin = true,
})

-- Waypaper
float_app("waypaper", {
    class = "^waypaper$",
    size = { 700, 600 },
    center = true,
    pin = true,
})

-- Blueman
float_app("blueman", {
    class = "^blueman-manager$",
    size = { 800, 600 },
    center = true,
})



-- Calculator + Calendar
float_app("calculator", {
    class = "^org\\.gnome\\.Calculator$",
    size = { 700, 600 },
    center = true,
})

float_app("calendar", {
    class = "^org\\.gnome\\.Calendar$",
    size = { 800, 600 },
    center = true,
})

-- Share picker
float_app("share-picker", {
    class = "^hyprland-share-picker$",
    size = { 600, 400 },
    center = true,
    pin = true,
})

-- Generic floating
float_app("dotfiles-floating", {
    class = "^dotfiles-floating$",
    size = { 900, 650 },
    center = true,
})

-------------------
-- VISUAL RULES
-------------------

hl.window_rule({
    name = "evince-opacity",
    match = { class = "^org\\.gnome\\.Evince$" },
    opacity = "1 1",
})

hl.window_rule({
    name = "obsidian-opacity",
    match = { class = "^obsidian$" },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "kanri" },
    decorate = false,
})
