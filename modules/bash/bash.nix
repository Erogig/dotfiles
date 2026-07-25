{ ... }: {
  flake.nixosModules.bash =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.bash =
    {
      pkgs,
      ...
    }:
    {
      programs.bash.enable = true;
    };
}
