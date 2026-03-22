{ pkgs, ... }:

{
    home.packages = with pkgs; [
        wl-clipboard
    ];

    services.clipse = {
        enable = true;
        imageDisplay.type = "kitty";
    };

    xdg.configFile."hypr/hyprland/clipse.conf" = {
        source = ./clipse.conf;
        force = true;
    };
}
