{ config, pkgs, ... }:

{
    programs.fish = {
        enable = true;
        shellAbbrs = {
            cl = "clear";
            ls = "ls -Ah";
            ll = "ls -Ahl";
            matrix = "unimatrix -af -s 97 -l gGkkkSss";
            ff = "fastfetch";
        };
        interactiveShellInit = "set fish_greeting";
    };

    home.shell.enableFishIntegration = true;
    home.file."${config.xdg.configHome}/fish/functions" = {source = ./../fish/functions;};
}
