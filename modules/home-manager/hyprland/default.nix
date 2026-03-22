{ config, pkgs, ... }:

{
wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    extraConfig = "source = ./hyprland/hyprland.conf";
    };

    xdg.configFile."hypr/hyprland" = {
        source = ./../hyprland;
        force = true; 
        recursive = true;
    };
}
