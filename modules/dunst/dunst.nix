{ ... }: {
  flake.nixosModules.dunst = {
    pkgs,
    ...
  }: {
    
  };

  flake.homeModules.dunst = {
    pkgs,
    ...
  }: {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          corner_radius = 15;
        };
      };
    };
  };
}
