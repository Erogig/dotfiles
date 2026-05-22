
-- #############
-- ### INPUT ###
-- #############

hl.config({
    input = {
        kb_layout = "se",
        kb_variant = "",
        kb_model = "",
        kb_options = "caps:return",
        kb_rules = "",

        follow_mouse = 2,
        float_switch_override_focus = 0,

        touchpad = {
            natural_scroll = true,
            clickfinger_behavior = true,
        },
    },
})

hl.device({
    name = "glorious-model-o",
    sensitivity = -0.5,
    accel_profile = "flat",
})

-- ################
-- ### MONITORS ###
-- ################

hl.monitor({
    output = "desc:Acer Technologies XB271HU A",
    mode = "2560x1440@165",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "eDP-1",
    mode = "1920x1200",
    position = "auto",
    scale = 1,
})

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
