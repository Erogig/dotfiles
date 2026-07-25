{ ... }: {
  flake.nixosModules.nvim =
    {
      pkgs,
      ...
    }:
    {

    };

  flake.homeModules.nvim =
    {
      pkgs,
      ...
    }:
    {
      programs.neovim = {
        enable = true;
        withRuby = true;
        withNodeJs = true;
        withPython3 = true;
        extraPackages = with pkgs; [
          ripgrep
          unzipNLS
        ];
        plugins = with pkgs; [
          vimPlugins.sqlite-lua
        ];
      };
      xdg.configFile."nvim" = {
        source = ./../nvim;
        force = true;
      };
    };
}
