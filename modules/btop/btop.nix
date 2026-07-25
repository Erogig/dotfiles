{ ... }: {
  flake.nixosModules.btop =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.btop =
    {
      pkgs,
      ...
    }:
    {
      programs.btop = {
        enable = true;
        settings = {
          shown_gpus = "intel";
          vim_keys = true;
        };
      };
    };
}
