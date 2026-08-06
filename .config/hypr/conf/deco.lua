-----------------------
---- LOOK AND FEEL ----
-----------------------

local colors = require("conf.border-deco")

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in          = 2,
        gaps_out         = 2,

        border_size      = 2,

        -- col              = {
        --     active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
        --     inactive_border = "rgba(595959aa)",
        -- },

        col              = colors.col,

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing    = false,

        layout           = "dwindle",
    },

    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = true
    },

    decoration = {
        rounding         = 2,
        rounding_power   = 10,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow           = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },


        blur = {
            enabled  = true,
            size     = 9,
            passes   = 3,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- === CURVES ===
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Nice smooth spring for general movement
hl.curve("gentleSpring", { type = "spring", mass = 1, stiffness = 85, dampening = 22 })

-- === ANIMATIONS ===
hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "easeOutQuint" })

hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "easeOutQuint" })

-- Main window animations - SLIDE
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6.5, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "easeOutQuint", style = "slide" })



hl.animation({ leaf = "fadeIn", enabled = true, speed = 4, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3.5, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "quick" })

hl.animation({ leaf = "layers", enabled = true, speed = 5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "easeOutQuint", style = "slidefade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 5.5, bezier = "easeOutQuint", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 5.5, bezier = "easeOutQuint", style = "slidefade" })

hl.animation({ leaf = "zoomFactor", enabled = true, speed = 6, bezier = "quick" })


-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})
