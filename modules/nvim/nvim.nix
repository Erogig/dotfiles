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
      lib,
      ...
    }:
    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        withRuby = true;
        withNodeJs = true;
        withPython3 = true;
        coc = {
          enable = true;
          settings = builtins.fromJSON (builtins.readFile ./coc-settings.json);
        };
        extraPackages = with pkgs; [
          ripgrep
          unzipNLS
          tree-sitter
          lua-language-server
        ];
        initLua = lib.mkMerge [(builtins.readFile ./init.lua) (builtins.readFile ./coc.lua) ];
        plugins = with pkgs.vimPlugins; [
          {
            plugin = sqlite-lua;
            type = "lua";
          }
          comment-nvim
          {
            plugin = telescope-nvim;
            type = "lua";
            config = builtins.readFile ./telescope.lua;
          }
          smart-open-nvim
          {
            plugin = nvim-treesitter;
            type = "lua";
            config = builtins.readFile ./treesitter.lua;
          }
          coc-sh
          coc-git
          coc-lua # not listed in CocList (doesn't work)
          coc-css
          coc-json
          coc-html
          coc-java
          coc-yaml
          coc-toml
          coc-nginx
          coc-pairs
          coc-eslint
          coc-docker
          coc-vimlsp
          # coc-svelte # super outdated and doesn't work
          coc-pyright
          coc-prettier
          coc-tailwindcss # not listed in CocList (doesn't work)
          coc-spell-checker
          nvim-treesitter-endwise
          nvim-treesitter-parsers.cpp
          nvim-treesitter-parsers.csv
          nvim-treesitter-parsers.css
          nvim-treesitter-parsers.html
          nvim-treesitter-parsers.http
          nvim-treesitter-parsers.fish
          nvim-treesitter-parsers.bash
          nvim-treesitter-parsers.java
          nvim-treesitter-parsers.json5
          nvim-treesitter-parsers.python
          nvim-treesitter-parsers.prisma
          nvim-treesitter-parsers.markdown
          nvim-treesitter-parsers.gitignore
          nvim-treesitter-parsers.typescript
          nvim-treesitter-parsers.javascript
          nvim-treesitter-parsers.systemverilog
          nvim-treesitter-parsers.regex
          nvim-treesitter-parsers.nix
          nvim-treesitter-parsers.c
          nvim-treesitter-parsers.dockerfile
          nvim-treesitter-parsers.lua
          nvim-treesitter-parsers.matlab
          nvim-treesitter-parsers.svelte
          nvim-treesitter-parsers.vim
          nvim-treesitter-parsers.nginx
          nvim-treesitter-parsers.graphql
          nvim-treesitter-parsers.rasi
          nvim-treesitter-parsers.kitty
          nvim-treesitter-parsers.toml
          nvim-treesitter-parsers.php
          nvim-treesitter-parsers.typst
          nvim-treesitter-parsers.sql
          nvim-treesitter-parsers.diff
        ];
      };
    };
}
