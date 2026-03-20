
{
    bootloader = import ./bootloader.nix;
    display-manager = import ./display-manager.nix;
    hyprland = import ./hyprland.nix;
    locale = import ./locale.nix;
    networking = import ./networking.nix;
    time = import ./time.nix;
    keymap = import ./keymap.nix;
    audio = import ./audio.nix;
    printing = import ./printing.nix;
    kitty = import ./kitty.nix;
    util = import ./util.nix;
    stylix = import ./stylix.nix;
    nautilus = import ./nautilus.nix;
    steam = import ./steam.nix;
}
