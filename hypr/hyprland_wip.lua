hl.monitor({
    output  = "",
    mode    = "preferred",
    position= "auto",
    scale   = "1.66667",
})

local terminal  = "kitty"
local fileManager = "dolphin"
local menu      = "rofi"
local notif     = "mako"

-- Startup apps
hl.on("hyprland.start", function ()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hyprwal") -- Also runs waybar
    hl.exec_cmd("gammastep_indicator")
    hl.exec_cmd(notif)
    hl.exec_cmd("xwaylandvideobridge")
    hl.exec_cmd("easyeffects --service-mode", { workspace = 8 })
    hl.exec_cmd("thunderbird", { workspace = 9 })
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("nm-applet & blueman-applet & micmute-led")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste -t text --watch clipman store --no-persist")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- Source files
require("hyprland.colors-hypr-fix")
require("hyprland.devices")
require("hyprland.keybinds")

-- Environment Variables
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_THEME" ,"HyprBibataModernClassicSVG")
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_SCALE_FACTOR", 1.5)
hl.env("GDK_SCALE", 2)

hl.config({
    input = {
        kb_layout = "us",
        numlock_by_default = true,
        
        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.6
        }
    },
    general = {
        -- See https://wiki.hyprland.org/Configuring/Variables/ for more
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        layout = master
        -- layout = dwindle
    },

    decoration = {
        rounding = 10,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        
        blur = {
            enabled = true,
            size = 5,
            passes = 2,
            new_optimizations = true,
            ignore_opacity = true
        }
    },

    animations = {
        enabled = true
    },

    dwindle = {
        preserve_split = true
    },

    master = {
        new_status = slave,
        mfact = 0.55
    },

    xwayland = {
        force_zero_scaling = true
    },

    misc = {
        allow_session_lock_restore = true,
        vrr = 1
    }
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace"
})
hl.gesture({
    fingers = 4,
    direction = "vertical",
    action = "fullscreen"
})
-- hl.gesture({
    -- fingers = 4,
    -- direction = "horizontal",
    -- mods = "SUPER",
    -- action = "dispatcher",
    -- args = "movetoworkspace"
--})
    

hl.curve("myBezier", {
    type = "bezier",
    points = {{0.05, 0.9}, {0.1, 1.05}}
})
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 2.5,
    bezier = "myBezier"
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2.5,
    style = "popin 80%",
    curve = "default"
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5,
    curve = "default"
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 4,
    curve = "default"
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 2,
    curve = "default"
})
hl.animation = ({
    leaf = "workspaces",
    enabled = true,
    speed = 1.8,
    curve = "default"
})
