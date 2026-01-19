{ config, pkgs, ... }:

{
programs.fish = {
    enable = true;
    };

    home.shell.enableFishIntegration = true;

    xdg.configFile."fish/config.fish" = {source = ./../fish/config.fish; force = true;};
    xdg.configFile."fish/fish_plugins" = {source = ./../fish/fish_plugins; force = true;};
    xdg.configFile."fish/functions" = {source = ./../fish/functions; force = true;};
    xdg.configFile."fish/themes" = {source = ./../fish/themes; force = true;};
}
