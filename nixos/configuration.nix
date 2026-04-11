# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, nixosModules, ... }:

{
    imports = with nixosModules; [
        bootloader
        greetd
        hyprland
        locale
        networking
        time
        keymap
        audio
        printing
        kitty
        util
        stylix
        nautilus
        steam
        pam
        wireguard
        ] ++ [
        ./hardware-configuration.nix
        ../home-manager/home-manager.nix
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.05"; # Do not change

    networking.hostName = "sidhe";

    users.users.erogig = {
        isNormalUser = true;
        description = "Erogig";
        extraGroups = [ "networkmanager" "wheel" ];
    };
}
