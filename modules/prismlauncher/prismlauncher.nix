{ ... }: {
  flake.nixosModules.prismlauncher =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.prismlauncher =
    {
      pkgs,
      ...
    }:
    {
      programs.prismlauncher = {
        enable = true;
      };
    };
}
