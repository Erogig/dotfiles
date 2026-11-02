{ ... }: {
  flake.nixosModules.noctalia =
    {
      pkgs,
      ...
    }:
    {
      services.upower.enable = true;
    };

  flake.homeModules.noctalia =
    {
      lib,
      pkgs,
      ...
    }:
    {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        settings = lib.mkDefault (builtins.fromTOML (builtins.readFile ./noctalia-config.toml));
      };

      wayland.windowManager.hyprland.settings = {
        bind = [
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. \" + SUPER_L\"")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.noctalia}/bin/noctalia msg panel-toggle launcher\")")
              { release = true; }
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. \" + CONTROL + S\"")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.noctalia}/bin/noctalia msg screenshot-fullscreen pick\")")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. \" + CONTROL + SHIFT + S\"")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.noctalia}/bin/noctalia msg screenshot-region\")")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. \" + V\"")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.noctalia}/bin/noctalia msg panel-toggle clipboard\")")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. \" + ESCAPE\"")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.noctalia}/bin/noctalia msg session lock\")")
            ];
          }
        ];
        window_rule = [
          {
            match = {
              class = "dev.noctalia.Noctalia";
            };
            float = true;
            size = lib.generators.mkLuaInline "{1080, 920}";
          }
        ];
        layer_rule = {
          name = "noctalia";
          match = {
            namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$";
          };
          no_anim = true;
          ignore_alpha = 0.5;
          blur = true;
          blur_popups = true;
        };
      };
    };
}
