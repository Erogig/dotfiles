{ ... }:

{
    programs.rmpc = {
        enable = true;
        config = builtins.readFile ./config.ron;
    };

    xdg.configFile."rmpc/themes/custom.ron" = {
        source = ./custom.ron;
        force = true;
    };

    programs.cava.enable = true;
}
