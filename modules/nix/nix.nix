{ ... }: {

  flake.nixosModules.nix =
    {
      pkgs,
      ...
    }:
    {
      programs.nh = {
        enable = true;
        flake = "/home/erogig/dotfiles";
        clean = {
          enable = true;
          extraArgs = "--keep 3 --keep-since 7d";
        };
      };
    };

  flake.homeModules.nix =
    {
      pkgs,
      ...
    }:
    {

    };
}
