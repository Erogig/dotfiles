{ pkgs, ... }:

{
    home.packages = [
        pkgs.noto-fonts
        pkgs.nerd-fonts.noto
        pkgs.font-awesome
    ];
    fonts.fontconfig.enable = true;
}
