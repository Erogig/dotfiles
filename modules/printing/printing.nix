{ ... }: {
  flake.nixosModules.printing =
    {
      pkgs,
      ...
    }:
    {
      services.printing.enable = true;
    };

  flake.homeModules.printing =
    {
      pkgs,
      ...
    }:
    {

    };
}
