{ pkgs, ... }:

{
programs.rofi = {
    enable = true;
    terminal = "kitty";
    extraConfig = {
        show-icons = true;
        };
    };
}
