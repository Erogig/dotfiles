{ ... }: {
  flake.nixosModules.nautilus =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = [
        pkgs.nautilus
      ];
      services.udisks2.enable = true;
    };

  flake.homeModules.nautilus =
    {
      pkgs,
      ...
    }:
    {
        services.udiskie = {
          enable = true;
        };
    };
}
