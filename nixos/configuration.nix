# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, nixMods, ... }:

{
    imports = [
        nixMods.bootloader
        nixMods.display-manager
        nixMods.hyprland
        nixMods.locale
        nixMods.networking
        nixMods.time
        nixMods.keymap
        nixMods.audio
        nixMods.printing
        nixMods.kitty
        nixMods.util
        nixMods.stylix
        nixMods.nautilus
        ./hardware-configuration.nix
        ../home-manager/home-manager.nix
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    programs.firefox.enable = true;

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.05"; # Do not change

    networking.hostName = "sidhe";

    users.users.erogig = {
        isNormalUser = true;
        description = "Erogig";
        extraGroups = [ "networkmanager" "wheel" ];
    };
}
