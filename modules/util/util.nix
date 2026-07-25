{ ... }: {
  flake.nixosModules.util = {
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      fastfetch
      libnotify
      brightnessctl
      playerctl
      bind
      yarn
    ];

    programs.npm.enable = true;
    virtualisation.docker.enable = true;
  };

  flake.homeModules.util = {
    pkgs,
    ...
  }: {
    
  };
}
