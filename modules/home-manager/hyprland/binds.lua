
-- ###################
-- ### KEYBINDINGS ###
-- ###################

-- temp
hl.bind("SUPER + Z", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty fish"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + CONTROL + Q", hl.dsp.window.kill())
hl.bind("SUPER + C", hl.dsp.window.float())
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd("pkill rofi || (pkill -SIGUSR1 waybar; rofi -show drun; pkill -SIGUSR1 waybar)"))

-- Alt Tab
hl.bind("ALT + TAB", hl.dsp.focus({ last = true }))

-- Hypershot
hl.bind("SUPER + CONTROL + S", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
hl.bind("SUPER + CONTROL + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --freeze --clipboard-only"))

-- Fullscreen
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen("maximized"))

-- Move focus
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

-- Move Window
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Move workspace
hl.bind("SUPER + CONTROL + H", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("SUPER + CONTROL + L", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("SUPER + CONTROL + K", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind("SUPER + CONTROL + J", hl.dsp.workspace.move({ monitor = "d" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Switch workspaces
hl.bind("SUPER + D", hl.dsp.focus({ workspace = "name:discord" }))
hl.bind("SUPER + W", hl.dsp.focus({ workspace = "name:browser" }))
hl.bind("SUPER + M", hl.dsp.focus({ workspace = "name:music" }))
hl.bind("SUPER + T", hl.dsp.focus({ workspace = "name:top" }))
hl.bind("SUPER + S", hl.dsp.focus({ workspace = "name:steam" }))

-- Move active window to a workspace
hl.bind("SUPER + SHIFT + D", hl.dsp.window.move({ workspace = "name:discord" }))
hl.bind("SUPER + SHIFT + W", hl.dsp.window.move({ workspace = "name:browser" }))
hl.bind("SUPER + SHIFT + M", hl.dsp.window.move({ workspace = "name:music" }))
hl.bind("SUPER + SHIFT + T", hl.dsp.window.move({ workspace = "name:top" }))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "name:steam" }))

hl.bind("SUPER + RIGHT", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + LEFT", hl.dsp.focus({workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true, locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
