{ ... }: {
  flake.nixosModules.kitty = {
    pkgs,
    ...
  }: {
    environment.systemPackages = [
      pkgs.kitty
    ];
  };

  flake.homeModules.kitty = {
    pkgs,
    ...
  }: {
    programs.kitty = {
      enable = true;
      inherit (pkgs.kitty);
    };
  };
}
