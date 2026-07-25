{ ... }: {
  flake.nixosModules.hyprcursor = {
    pkgs,
    ...
  }: {
    
  };

  flake.homeModules.hyprcursor = {
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      hyprcursor
    ];

    home.pointerCursor = {
      enable = true;
      hyprcursor.enable = true;
      hyprcursor.size = 24;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}
