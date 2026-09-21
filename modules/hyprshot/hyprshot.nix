{ ... }: {
  flake.nixosModules.hyprshot =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.hyprshot =
    {
      lib,
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        hyprpicker
      ];

      programs.hyprshot = {
        enable = true;
      };

      wayland.windowManager.hyprland = {
        settings = {
          bind = [
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + CONTROL + S\"")
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m output --clipboard-only\")")
              ];
            }
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + CONTROL + SHIFT + S\"")
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m region --freeze --clipboard-only\")")
              ];
            }
          ];
        };
      };
    };
}
