
vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

local lsp_servers = {
    "bashls",
    "clangd",
    "cssls",
    "docker_language_server",
    "fish_lsp",
    "graphql",
    "hyprls",
    "jsonls",
    "lua_ls",
    "prismals",
    "pylsp",
    "systemd_ls",
    "ts_ls",
}

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = lsp_servers })
