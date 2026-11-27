-- Hyprland config (Lua, Hyprland 0.55+; the old hyprland.conf format was dropped in 0.57)
-- Wiki: https://wiki.hypr.land/configuring/
-- Ported from my old hyprland.conf.

-- Colors: swap to require("rose-pine-dawn") for the light variant
local c = require("rose-pine")


------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1.25, -- 15" 1920x1080; "auto" picked 1.5, which is too large
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "ghostty"
local fileManager = "ghostty -e yazi"
local menu        = "rofi -show drun"
local browser     = "firefox"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    -- Dark mode for apps that follow the system theme (via xdg-desktop-portal-gtk)
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'")
    -- Middle-click paste in GTK apps like Ghostty (GNOME now turns it off by default)
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-enable-primary-paste true")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = { colors = { c.rose, c.pine, c.love, c.iris }, angle = 90 },
            inactive_border = c.muted,
        },

        resize_on_border = true,
        allow_tearing    = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 15,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 2,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_options = "caps:swapescape",

        follow_mouse  = 0,
        sensitivity   = 0,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
        },
    },

    gestures = {
        workspace_swipe_distance       = 200,
        workspace_swipe_touch          = true,
        workspace_swipe_direction_lock = true,
        workspace_swipe_forever        = false,
    },
})

-- 3-finger horizontal swipe switches workspaces
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + M",      hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space",  hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",      hl.dsp.window.pseudo())
hl.bind(mainMod .. " + V",      hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd(browser))

-- Lock screen (the old config used an undefined $SUPER_SHIFT variable here, so this bind never worked)
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("hyprlock"))

-- Screenshots with hyprshot
hl.bind("Print",         hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region"))

-- Focus / move / resize: arrows and vim keys
local dirs = { h = "left", j = "down", k = "up", l = "right" }
for key, dir in pairs(dirs) do
    hl.bind(mainMod .. " + " .. key,          hl.dsp.focus({ direction = dir }))
    hl.bind(mainMod .. " + " .. dir,          hl.dsp.focus({ direction = dir }))
    hl.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ direction = dir }))
end

hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -10, y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0,   y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }), { repeating = true })

-- Workspaces 1-10 (key 0 = workspace 10)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop media keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"),                          { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),                          { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({ name = "float-volume-control", match = { title = "^(Volume Control)$" }, float = true })
hl.window_rule({ name = "firefox-on-2",         match = { class = "^(firefox)$" },        workspace = "2" })
hl.window_rule({ name = "discord-on-4",         match = { class = "^(discord)$" },        workspace = "4" })

-- Ignore maximize requests from apps
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
