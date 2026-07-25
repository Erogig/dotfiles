{ ... }: {
  flake.nixosModules.kdeconnect =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.kdeconnect =
    {
      pkgs,
      ...
    }:
    {
      services.kdeconnect = {
        enable = true;
        indicator = true;
      };
    };
}
