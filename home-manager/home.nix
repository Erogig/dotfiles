{ homeManagerModules, ... }:

{
    imports = with homeManagerModules; [
        bash
        fish
        git
        hyprland
        rofi
        waybar
        hyprpaper
        kitty
        nvim
        vesktop
        dunst
        nm
        stylix
        fonts
        librewolf
        btop
        cursor
        audio
        wireplumber
        gh
        hyprlock
    ];
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "erogig";
    home.homeDirectory = "/home/erogig";

    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "25.11"; # Please read the comment before changing.

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    systemd.user.startServices = "sd-switch";
}
