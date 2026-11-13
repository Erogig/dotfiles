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
      programs.nixvim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        withNodeJs = true;
        globals = {
          mapleader = " ";
        };
        opts = {
          termguicolors = true;
          number = true;
          relativenumber = true;
          signcolumn = "yes:1";
          cursorline = true;
          linebreak = true;
          list = true;
          listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂";
          ignorecase = true;
          smartcase = true;
          tabstop = 4;
          shiftwidth = 0;
          clipboard = "unnamedplus";
        };
        dependencies = {
          ripgrep.enable = true;
          fd.enable = true;
          git.enable = true;
          tree-sitter.enable = true;
        };
        plugins = {
          comment.enable = true;
          telescope = {
            enable = true;
            extensions = {
              frecency.enable = true;
            };
            keymaps = {
              "<Leader>p" = "frecency";
              "<Leader>g" = "live_grep";
              "<Leader>s" = "spell_suggest";
            };
          };
          treesitter = {
            enable = true;
            highlight.enable = true;
            indent.enable = true;
            folding.enable = true;
          };
          treesitter-context.enable = true;
          lspconfig.enable = true;
          lsp-format.enable = true;
          cmp = {
            enable = true;
            settings.sources = [
              { name = "nvim_lsp"; }
              { name = "path"; }
              { name = "dictionary"; }
            ];
          };
          nvim-autopairs.enable = true;
          guess-indent.enable = true;
          gitsigns = {
            enable = true;
            settings = {
              current_line_blame = true;
              current_line_blame_opts.delay = 100;
            };
          };
          precognition.enable = true;
        };
        lsp = {
          servers = {
            bashls.enable = true;
            clangd.enable = true;
            cmake.enable = true;
            cssls.enable = true;
            docker_language_server.enable = true;
            eslint.enable = true;
            fish_lsp.enable = true;
            graphql.enable = true;
            html.enable = true;
            java_language_server.enable = true;
            jsonls.enable = true;
            lua_ls.enable = true;
            markdown_oxide.enable = true;
            matlab_ls.enable = true;
            nixd.enable = true;
            postgres_lsp.enable = true;
            pyright.enable = true;
            svelte.enable = true;
            systemd_lsp.enable = true;
            tailwindcss.enable = true;
            ts_ls.enable = true;
          };
        };
      };
    };
}
