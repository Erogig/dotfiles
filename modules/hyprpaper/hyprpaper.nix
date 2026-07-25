{ ... }: {
  flake.nixosModules.hyprpaper =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.hyprpaper =
    {
      pkgs,
      ...
    }:
    {
      services.hyprpaper.enable = true;
    };
}
