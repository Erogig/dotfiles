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
      services.gvfs.enable = true;
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
