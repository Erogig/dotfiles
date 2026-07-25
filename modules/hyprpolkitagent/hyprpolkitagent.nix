{ ... }: {
  flake.nixosModules.hyprpolkitagent =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.hyprpolkitagent =
    {
      pkgs,
      ...
    }:
    {
      services.hyprpolkitagent.enable = true;
    };
}
