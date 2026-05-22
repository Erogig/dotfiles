{ config, pkgs, ... }:

{
wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    configType = "lua";

    #extraConfig = "source = ./hyprland/hyprland.conf";
    extraConfig = "require(\"hyprland.hyprland\")";
    };

    xdg.configFile."hypr/hyprland" = {
        source = ./../hyprland;
        force = true; 
        recursive = true;
    };
}
