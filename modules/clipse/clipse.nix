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

      xdg.configFile."hypr/hyprland/clipse.lua" = {
        source = ./clipse.lua;
        force = true;
      };
    };
}
