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
    };
}
