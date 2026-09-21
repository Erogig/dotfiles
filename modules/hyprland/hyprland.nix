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
        extraLuaFiles = {
          "binds" = ./binds.lua;
          "devices" = ./devices.lua;
          "gestures" = ./gestures.lua;
          "env" = ./env.lua;
          "looks" = ./looks.lua;
          "workspaces" = ./workspaces.lua;
        };
        settings = {
          mainMod = {
            _var = "SUPER";
          };
        };
      };
    };
}
