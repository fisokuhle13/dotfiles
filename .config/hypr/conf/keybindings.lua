---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Programs
local terminal = "kitty"
local browser = "zen-browser"
local fileManager = "nautilus"
local menu = "rofi -show drun"
local wallpaper = "waypaper"
local wifi = "~/dotfiles/global/scripts/network.sh"

-------------------
-- LOCK / SYSTEM --
-------------------

hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("systemctl suspend"))

hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("rofimoji --action copy"))

-------------
-- SCRIPTS --
-------------

hl.bind(mainMod .. " + R",
    hl.dsp.exec_cmd("~/dotfiles/global/scripts/bookworm.sh"))

hl.bind(mainMod .. " + CTRL + B",
    hl.dsp.exec_cmd("~/.config/waybar/scripts/switch-theme.sh"))

hl.bind(mainMod .. " + SHIFT + B",
    hl.dsp.exec_cmd("~/.config/waybar/scripts/switch-bar.sh"))

hl.bind(mainMod .. " + T",
    hl.dsp.exec_cmd("~/dotfiles/global/scripts/update-settings-and-switch.sh"))

hl.bind(mainMod .. " + V",
    hl.dsp.exec_cmd("~/dotfiles/global/scripts/clipboard-history.sh"))

hl.bind(mainMod .. " + PRINT",
    hl.dsp.exec_cmd("~/dotfiles/global/scripts/screenshot.sh"))

----------------
-- APPLICATIONS
----------------

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpaper))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(wifi))

hl.bind(mainMod .. " + SHIFT + W",
    hl.dsp.exec_cmd("waypaper --random"))

----------------
-- WINDOW MGMT --
----------------

hl.bind(mainMod .. " + F",
    hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + Q",
    hl.dsp.window.close())

hl.bind(mainMod .. " + M",
    hl.dsp.exit())

hl.bind(mainMod .. " + P",
    hl.dsp.window.pseudo())

hl.bind(mainMod .. " + SHIFT + SPACE",
    hl.dsp.layout("swapsplit"))

hl.bind(mainMod .. " + SPACE", hl.dsp.layout("togglesplit"))



----------------
-- FOCUS (VIM)--
----------------

hl.bind(mainMod .. " + H",
    hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + L",
    hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + K",
    hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + J",
    hl.dsp.focus({ direction = "down" }))

----------------
-- WORKSPACES --
----------------

for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }))

    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }))
end

-------------------------
-- SPECIAL WORKSPACE  --
-------------------------

hl.bind(mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" }))

----------------
-- RESIZE WINDOWS --
----------------
hl.bind(mainMod .. " + SHIFT + RIGHT",
    hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
    { repeating = true })

hl.bind(mainMod .. " + SHIFT + LEFT",
    hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
    { repeating = true })

hl.bind(mainMod .. " + SHIFT + DOWN",
    hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
    { repeating = true })

hl.bind(mainMod .. " + SHIFT + UP",
    hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
    { repeating = true })



----------------
-- GROUPING   --
----------------

hl.bind(mainMod .. " + G",
    hl.dsp.exec_cmd("hyprctl dispatch togglegroup"))

----------------
-- SWAPWINDOW --
----------------
hl.bind(mainMod .. " + SHIFT + H",
    hl.dsp.window.swap({ direction = "l" }))

hl.bind(mainMod .. " + SHIFT + L",
    hl.dsp.window.swap({ direction = "r" }))

hl.bind(mainMod .. " + SHIFT + K",
    hl.dsp.window.swap({ direction = "u" }))

hl.bind(mainMod .. " + SHIFT + J",
    hl.dsp.window.swap({ direction = "d" }))

----------------
-- ALT TAB    --
----------------

hl.bind("ALT + TAB",
    hl.dsp.exec_cmd("hyprctl dispatch cyclenext"))

hl.bind("ALT + TAB",
    hl.dsp.exec_cmd("hyprctl dispatch bringactivetotop"))

----------------
-- ACTIONS    --
----------------

hl.bind(mainMod .. " + CTRL + R",
    hl.dsp.exec_cmd("hyprctl reload"))

----------------
-- SCROLL WS  --
----------------

hl.bind(mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" }))

-------------------------
-- MOVE / RESIZE MOUSE --
-------------------------

hl.bind(mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true })

hl.bind(mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true })


-------------------
-- AUDIO / BRIGHTNESS
-------------------

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })

hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true })

----------------
-- PLAYERCTL  --
----------------

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true })

hl.bind("XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true })

hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true })

hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true })
