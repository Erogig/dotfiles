{ ... }: {
  flake.nixosModules.rmpc =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.rmpc =
    {
      lib,
      pkgs,
      ...
    }:
    {
      programs.rmpc = {
        enable = true;
        config = builtins.readFile ./config.ron;
      };

      xdg.configFile."rmpc/themes/custom.ron" = {
        source = ./custom.ron;
        force = true;
      };

      programs.cava.enable = true;

      wayland.windowManager.hyprland = {
        settings = {
          bind = [
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + M\"")
                (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"name:music\"})")
              ];
            }
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + SHIFT + M\"")
                (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = \"name:music\"})")
              ];
            }
          ];
        };
      };

    };
}
