{ ... }: {
  flake.nixosModules.vesktop =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.vesktop =
    {
      lib,
      pkgs,
      ...
    }:
    {
      programs.vesktop = {
        enable = true;
        settings = {
          discordBranch = "stable";
          minimizeToTray = "false";
          arRPC = "false";
          enableSplashScreen = "false";
        };
      };

      wayland.windowManager.hyprland = {
        settings = {
          bind = [
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + D\"")
                (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"name:discord\"})")
              ];
            }
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + SHIFT + D\"")
                (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = \"name:discord\"})")
              ];
            }
          ];
        };
      };
    };
}
