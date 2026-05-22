{ pkgs, ... }:

{
    home.packages = with pkgs; [
        wl-clipboard
    ];

    services.clipse = {
        enable = true;
        imageDisplay.type = "kitty";
    };

    xdg.configFile."hypr/hyprland/clipse.lua" = {
        source = ./clipse.lua;
        force = true;
    };
}
