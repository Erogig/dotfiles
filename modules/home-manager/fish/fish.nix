{ config, pkgs, ... }:

{
programs.fish = {
    enable = true;
    };

    home.shell.enableFishIntegration = true;
    xdg.configFile."fish" = {source = ./../fish; force = true;};
}
