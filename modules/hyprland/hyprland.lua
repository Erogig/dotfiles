
require("hyprland.devices")
require("hyprland.looks")
require("hyprland.binds")
require("hyprland.gestures")
require("hyprland.workspaces")
require("hyprland.clipse")

hl.on("hyprland.start", function ()
    hl.exec_cmd("hyprlock")
    hl.exec_cmd("pidof -q vesktop || vesktop", {workspace = "name:discord"})
    hl.exec_cmd("pidof -q librewolf || librewolf", {workspace = "name:browser"})
    hl.exec_cmd("pidof -q rmpc || kitty rmpc", {workspace = "name:music"})
    hl.exec_cmd("pidof -q btop || kitty btop", {workspace = "name:top"})
    hl.exec_cmd("pidof -q steam || steam", {workspace = "name:steam"})
end)

-- Fix Electron
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

