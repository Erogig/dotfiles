{ ... }: {
  flake.nixosModules.hyprshot = {
    pkgs,
    ...
  }: {
    
  };

  flake.homeModules.hyprshot = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      hyprpicker
    ];

    programs.hyprshot = {
      enable = true;
    };
  };
}
