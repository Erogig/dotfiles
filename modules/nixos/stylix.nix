{ stylix, pkgs, ... }:

{
    stylix = {
        enable = true;
        polarity = "dark";
        image = ../../backgrounds/background.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    };
}
