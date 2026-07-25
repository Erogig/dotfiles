{ ... }: {
  flake.nixosModules.remmina = {
    pkgs,
    ...
  }: {
    
  };

  flake.homeModules.remmina = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      remmina
    ];
  };
}
