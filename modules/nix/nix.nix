{ ... }: {

  perSystem = { pkgs, ... }: {
    formatter = pkgs.nixfmt-tree;
  };

  flake.nixosModules.nix =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.nix =
    {
      pkgs,
      ...
    }:
    {

    };
}
