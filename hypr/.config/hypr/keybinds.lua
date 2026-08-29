---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secMod = "ALT"
local thirdMod = "CTRL"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("wezterm"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(secMod .. " + V", hl.dsp.exec_cmd("vscodium"))
hl.bind(secMod .. " + B", hl.dsp.exec_cmd("librewolf"))
hl.bind(secMod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(secMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(secMod .. " + E", hl.dsp.exec_cmd("easyeffects"))

--brightness
hl.bind("F5", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 3 down"))
hl.bind("F6", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 3 up"))
hl.bind("SHIFT + F5", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 4 down"))
hl.bind("SHIFT + F6", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 4 up"))
hl.bind("CTRL + F5", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 6 down"))
hl.bind("CTRL + F6", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 6 up"))

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))


hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
local closeWindowBind = hl.bind(secMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

hl.bind(secMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("vicinae toggle"), { description = "Toggle Vicinae launcher" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim ~/Pictures/screenshot_$(date +%Y%m%d_%H%M%S).png"))
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | swappy -f -"))


-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

--script for moving all desktops to new section
for i = 1, 3 do
    hl.bind(secMod .. " + " .. i,         hl.dsp.exec_cmd("~/.config/hypr/scripts/workspace-group.sh " .. i))
    hl.bind(mainMod .. " + " .. i, hl.dsp.exec_cmd("~/.config/hypr/scripts/workspace-group-move.sh " .. i))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move active window to a monitor in a direction with thirdMod + secMod + arrow keys
hl.bind(thirdMod .. " + " .. secMod .. " + left",  hl.dsp.window.move({ monitor = "l" }))
hl.bind(thirdMod .. " + " .. secMod .. " + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(thirdMod .. " + " .. secMod .. " + up",    hl.dsp.window.move({ monitor = "u" }))
hl.bind(thirdMod .. " + " .. secMod .. " + down",  hl.dsp.window.move({ monitor = "d" }))


-- Move/resize windows with mainMod + LMB/RMB and dragging
--hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
--hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Side-button drag/resize (conflicts with Rivals abilities — gated behind gaming submap)
hl.bind("mouse:275", hl.dsp.window.drag(),   { mouse = true })
hl.bind("mouse:276", hl.dsp.window.resize(), { mouse = true })

hl.define_submap("gaming", function()
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
    hl.bind(secMod .. " + C", hl.dsp.window.close())

    hl.bind("F5", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 3 down"))
    hl.bind("F6", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 3 up"))
    hl.bind("SHIFT + F5", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 4 down"))
    hl.bind("SHIFT + F6", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 4 up"))
    hl.bind("CTRL + F5", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 6 down"))
    hl.bind("CTRL + F6", hl.dsp.exec_cmd("~/.config/waybar/scripts/brightness.sh 6 up"))

    hl.bind("SUPER + F12", hl.dsp.submap("reset"), { description = "Force exit gaming mode" })
end)

hl.on("window.active", function(win)
    if win and win.class == "steam_app_2767030" then
        hl.dispatch(hl.dsp.submap("gaming"))
        
    else
        hl.dispatch(hl.dsp.submap("reset"))
    end
end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
--hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
--hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd(
  "hyprctl dispatch togglefloating active && hyprctl dispatch togglefloating active"
))