{ ... }: {
  flake.nixosModules.stylix = {
    pkgs,
    ...
  }: {
    stylix = {
      enable = true;
      polarity = "dark";
      image = ../../backgrounds/background.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    };
  };

  flake.homeModules.stylix = {
    pkgs,
    ...
  }: {
    home.packages = [
      pkgs.noto-fonts
      pkgs.nerd-fonts.noto
      pkgs.font-awesome
    ];
    fonts.fontconfig.enable = true;

    stylix.fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      monospace = {
        package = pkgs.noto-fonts;
        name = "Noto Sans Mono";
      };
      emoji = {
        package = pkgs.noto-fonts;
        name = "Noto Color Emoji";
      };
    };
  };
}
