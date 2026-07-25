{ ... }: {
  flake.nixosModules.git = {
    pkgs,
    ...
  }: {
    
  };

  flake.homeModules.git = {
    pkgs,
    ...
  }: {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user.email = "erogigabyte@gmail.com";
        user.name = "Erogig";
      };
    };
  };
}
