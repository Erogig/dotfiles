{ pkgs, ... }:

{
    stylix.fonts = {
        serif = {
            package = pkgs.noto-fonts;
            name = "Noto Serif";
        };
        sansSerif = {
            package = pkgs.noto-fonts;
            name = "Noto Sans";
        };
        monospace = {
            package = pkgs.noto-fonts;
            name = "Noto Sans Mono";
        };
        emoji = {
            package = pkgs.noto-fonts;
            name = "Noto Color Emoji";
        };
    };
}
