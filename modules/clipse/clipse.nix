{ ... }: {
  flake.nixosModules.clipse =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.clipse =
    {
      lib,
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        wl-clipboard
      ];

      services.clipse = {
        enable = true;
        settings.imageDisplay.type = "kitty";
      };

      wayland.windowManager.hyprland = {
        settings = {
          bind = [
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + V\"")
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.kitty}/bin/kitty --class clipse -e ${pkgs.clipse}/bin/clipse\")")
              ];
            }
          ];

          window_rule = [
            {
              match = {
                class = "(clipse)";
              };
              float = true;
              size = (lib.generators.mkLuaInline "{622, 652}");
              stay_focused = true;
            }
          ];
        };
      };
    };
}
