{ ... }: {
  flake.nixosModules.nautilus = {
    pkgs,
    ...
  }: {
    environment.systemPackages = [
      pkgs.nautilus
    ];
  };

  flake.homeModules.nautilus = {
    pkgs,
    ...
  }: {
    
  };
}
