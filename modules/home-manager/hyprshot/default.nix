{ pkgs, ... }:

{
    home.packages = with pkgs; [
        hyprpicker
    ];

    programs.hyprshot = {
        enable = true;
    };
}
