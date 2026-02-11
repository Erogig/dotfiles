{ inputs, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
        withNodeJs = true;
        withPython3 = true;
        extraPackages = [
            pkgs.ripgrep
            pkgs.unzipNLS
        ];
        plugins = [
            pkgs.vimPlugins.sqlite-lua
        ];
    };

    xdg.configFile."nvim" = {source = ./../nvim; force = true;};
}
