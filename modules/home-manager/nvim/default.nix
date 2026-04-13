{ inputs, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        withRuby = false;
        withNodeJs = true;
        withPython3 = true;
        extraPackages = [
            pkgs.ripgrep
            pkgs.unzipNLS
            #pkgs.tree-sitter
        ];
        plugins = [
            pkgs.vimPlugins.sqlite-lua
        ];
    };

    xdg.configFile."nvim" = {source = ./../nvim; force = true;};
}
