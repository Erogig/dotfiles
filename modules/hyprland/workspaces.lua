
-- ##############################
-- ### WINDOWS AND WORKSPACES ###
-- ##############################

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

hl.window_rule({
    -- Fix some dragging issues with XWayland
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

hl.workspace_rule({
    workspace = "name:discord",
    persistent = true,
    monitor = "desc:Fujitsu Siemens Computers GmbH L24T-1 LED",
    default = true,
})
hl.workspace_rule({
    workspace = "name:browser",
    persistent = true,
})
hl.workspace_rule({
    workspace = "name:music",
    persistent = true,
})
hl.workspace_rule({
    workspace = "name:top",
    persistent = true,
})
hl.workspace_rule({
    workspace = "name:steam",
    persistent = true,
})
