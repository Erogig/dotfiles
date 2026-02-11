{ ... }:

{
    programs.waybar.enable = true;
    xdg.configFile."waybar" = { source = ./../waybar; force = true; };
    stylix.targets.waybar.addCss = false;
}
