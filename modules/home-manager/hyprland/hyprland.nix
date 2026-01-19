{ config, pkgs, ... }:

{
wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    extraConfig = builtins.readFile ./hyprland.conf;
    };

    

    xdg.configFile."hypr/hyprland" = { source = ./../hyprland; force = true; };
}
