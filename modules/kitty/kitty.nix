{ ... }: {
  flake.nixosModules.kitty =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = [
        pkgs.kitty
      ];
    };

  flake.homeModules.kitty =
    {
      lib,
      pkgs,
      ...
    }:
    {
      programs.kitty = {
        enable = true;
        inherit (pkgs.kitty);
      };

      wayland.windowManager.hyprland = {
        settings = {
          bind = [
            {
              _args = [
                (lib.generators.mkLuaInline "mainMod .. \" + RETURN\"")
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.kitty}/bin/kitty\")")
              ];
            }
          ];
        };
      };
    };
}
