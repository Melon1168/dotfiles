-- Main modifiers
local mod = "SUPER"
local modCtrl = mod .. " + CTRL"
local modShift = mod .. " + SHIFT"
local modAlt = mod .. " + ALT"
local modCtrlShift = modCtrl .. " + SHIFT"
local modCtrlAlt = modCtrl .. " + ALT"
local modShiftAlt = modShift .. " + ALT"
local modCtrlShiftAlt = modCtrlShift .. " + ALT"
local terminal  = "kitty"
local fileManager = "dolphin"
local menu      = "rofi"
local notif     = "mako"

-- Launch and window control
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(modShift .. " + Q", hl.dsp.exit())
hl.bind(mod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + Space", hl.dsp.exec_cmd(menu .. " -show run"))
hl.bind(modCtrl .. " + Space", hl.dsp.exec_cmd(menu .. " -show drun"))
hl.bind(mod .. " + F", hl.dsp.layout("swapwithmaster"))
hl.bind(modCtrl .. " + P", hl.dsp.layout("pseudotile"))
hl.bind(mod .. " + ESCAPE", hl.dsp.exec_cmd("nwg-bar"))
hl.bind(modShift .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Media and system controls
hl.bind(mod .. " + P", hl.dsp.exec_cmd("mpc toggle"))
hl.bind(modShift .. " + P", hl.dsp.exec_cmd(terminal .. " rmpc"))
hl.bind(modCtrl .. " + comma", hl.dsp.exec_cmd("mpc prev"))
hl.bind(modCtrl .. " + period", hl.dsp.exec_cmd("mpc next"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("micmute-led"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 2"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 2"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind(modCtrl .. " + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1+"))
hl.bind(modCtrl .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1-"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("mpc toggle"))
hl.bind(mod .. " + XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mod .. " + XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mod .. " + XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mod .. " + XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("mpc toggle"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("mpc next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("mpc prev"))
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("hyprtracktoggle"))
hl.bind(mod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd("mpc volume -2"))
hl.bind(mod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("mpc volume +2"))

-- Utility binds
hl.bind(modShift .. " + S", hl.dsp.exec_cmd("grimblast --freeze copy area"))
hl.bind(modCtrlShift .. " + S", hl.dsp.exec_cmd("grimblast --freeze save area"))
hl.bind(mod .. " + F5", hl.dsp.exec_cmd("hyprwal"))
hl.bind(modCtrl .. " + V", hl.dsp.exec_cmd("clipman pick -t rofi"))
hl.bind(modCtrlShiftAlt .. " + M", hl.dsp.exec_cmd("zen-browser minesweeper.online"))
hl.bind(modCtrlShiftAlt .. " + T", hl.dsp.exec_cmd("gamemoderun tetrio-desktop"))
hl.bind("XF86Launch2", hl.dsp.exec_cmd("gamemoderun tetrio-desktop"))
hl.bind(mod .. " + XF86Launch2", hl.dsp.exec_cmd("toggle-gaps"))
hl.bind(modCtrlShiftAlt .. " + space", hl.dsp.exec_cmd("discord-flags"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd("hyprvoice toggle"))
hl.bind(mod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))

-- Focus movement
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Workspace navigation
for i = 1, 9 do
    hl.bind(mod .. " + " .. tostring(i), hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(modShift .. " + " .. tostring(i), hl.dsp.window.move({ workspace = tostring(i) }))
end

hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(modShift .. " + 0", hl.dsp.window.move({ workspace = "10" }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + Left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + Right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(modCtrl .. " + mouse_down", hl.dsp.exec_cmd("brightnessctl set 1%+"))
hl.bind(modCtrl .. " + mouse_up", hl.dsp.exec_cmd("brightnessctl set 1%-"))

-- Mouse dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
