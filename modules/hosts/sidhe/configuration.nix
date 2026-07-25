{ self, inputs, ... }:
let
  modules = moduleSet: with moduleSet; [
    audio
    bash
    batsignal
    # bitwarden
    bootloader
    btop
    clipse
    dunst
    fingerprint
    fish
    gh
    git
    greetd
    hyprcursor
    hypridle
    hyprland
    hyprlock
    hyprpaper
    hyprpolkitagent
    hyprshot
    kdeconnect
    kitty
    librewolf
    mpd
    nautilus
    networkmanager
    nvim
    printing
    prismlauncher
    remmina
    rmpc
    rofi
    steam
    stylix
    sway-audio-idle-inhibit
    syshud
    util
    vesktop
    vscode
    waybar
    wireguard
  ];
in
{
  # This is your system configuration entry-point
  flake.nixosConfigurations.sidhe = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.sidheModule
      # self.nixosModules.homeManager
      inputs.stylix.nixosModules.stylix
      inputs.nixos-hardware.nixosModules.dell-xps-15-9530-nvidia
    ];
  };

  # This is your configuration.nix, a place where you configure your system
  flake.nixosModules.sidheModule = { pkgs, ... }: {
    imports = (modules self.nixosModules) ++ [
      inputs.home-manager.nixosModules.default # import official home-manager NixOS module
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.05"; # Do not change

    networking.hostName = "sidhe";

    time.timeZone = "Europe/Stockholm";

    i18n = {
      defaultLocale = "en_GB.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "sv_SE.UTF-8";
        LC_IDENTIFICATION = "sv_SE.UTF-8";
        LC_MEASUREMENT = "sv_SE.UTF-8";
        LC_MONETARY = "sv_SE.UTF-8";
        LC_NAME = "sv_SE.UTF-8";
        LC_NUMERIC = "sv_SE.UTF-8";
        LC_PAPER = "sv_SE.UTF-8";
        LC_TELEPHONE = "sv_SE.UTF-8";
        LC_TIME = "sv_SE.UTF-8";
      };
    };

    console.keyMap = "sv-latin1";

    users.users.erogig = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
    home-manager.users = {
      erogig = self.homeModules.erogigModule;
    };

    services.greetd.settings.default_session.user = "erogig";
  };

  # This is your home.nix, your module where you configure home-manager
  flake.homeModules.erogigModule = { pkgs, ...}: {

    imports = (modules self.homeModules) ++ [
    ];

    home.username = "erogig";
    home.homeDirectory = "/home/erogig";

    nixpkgs.config.allowUnfree = true;

    systemd.user.startServices = "sd-switch"; # automatically starts/stops/reloads systemd services when activating a Home Manager configuration

    home.stateVersion = "25.11";
  };
}
