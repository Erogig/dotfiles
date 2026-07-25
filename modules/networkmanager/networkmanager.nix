{ ... }: {
  flake.nixosModules.networkmanager =
    {
      pkgs,
      ...
    }:
    {
      networking.networkmanager.enable = true;
    };

  flake.homeModules.networkmanager =
    {
      pkgs,
      ...
    }:
    {
      services.network-manager-applet.enable = true;
    };
}
