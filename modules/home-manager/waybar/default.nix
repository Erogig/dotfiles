{ pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = builtins.fromJSON (builtins.readFile ./config.json);
        style = builtins.readFile ./style.css;
    };

    stylix.targets.waybar = {
        fonts.override = { 
            monospace = {
                package = pkgs.nerd-fonts.noto;
                name = "NotoSans Nerd Font Propo";
            };
    };
        addCss = false;
    };
}
