
-- Rules for window manager

hl.window_rule({
    match = {
        class = "(clipse)"
    },
    float = true,
    size = {622, 652},
    stay_focused = true,
})

hl.bind("SUPER + V", hl.dsp.exec_cmd("kitty --class clipse -e clipse"))
