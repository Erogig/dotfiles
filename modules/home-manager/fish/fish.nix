{ config, pkgs, ... }:

{
programs.fish.enable = true;
xdg.configFile."fish" = {source = ./../fish; force = true;};
}
