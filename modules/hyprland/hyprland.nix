{ ... }: {
  flake.nixosModules.hyprland =
    {
      pkgs,
      ...
    }:
    {
      programs.hyprland.enable = true;
    };

  flake.homeModules.hyprland =
    {
      pkgs,
      ...
    }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;
        configType = "lua";
        extraConfig = "require(\"hyprland.hyprland\")";
      };

      xdg.configFile."hypr/hyprland" = {
        source = ./../hyprland;
        force = true;
        recursive = true;
      };
    };
}
