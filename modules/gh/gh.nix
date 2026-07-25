{ ... }: {
  flake.nixosModules.gh =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.gh =
    {
      pkgs,
      ...
    }:
    {
      programs.gh.enable = true;
    };
}
