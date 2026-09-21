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
      lib,
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

      wayland.windowManager.hyprland = {
        settings = {
          bind = [
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + T\"")
                (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"name:top\"})")
              ];
            }
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + SHIFT + T\"")
                (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = \"name:top\"})")
              ];
            }
          ];
        };
      };

    };
}
