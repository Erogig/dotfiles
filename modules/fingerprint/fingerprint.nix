{ ... }: {
  flake.nixosModules.fingerprint =
    {
      pkgs,
      ...
    }:
    {
      services.fprintd.enable = true;
    };

  flake.homeModules.fingerprint =
    {
      pkgs,
      ...
    }:
    {

    };
}
