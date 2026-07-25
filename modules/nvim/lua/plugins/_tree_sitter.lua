
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local ts_parsers = {
    "svelte",
    "typescript",
    "javascript",
    "bash",
    "css",
    "lua",
    "fish",
    "hyprland",
    "prisma",
    "graphql",
    "json",
}

require("nvim-treesitter").install(ts_parsers)

vim.api.nvim_create_autocmd("PackChanged", { -- update treesitter parsers/queries with plugin updates
    callback = function(event)
        local spec = event.data.spec
        if spec and spec.name == "nvim-treesitter" and event.data.kind == "update" then
            vim.schedule(TSUpdate)
        end
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})

vim.o.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

