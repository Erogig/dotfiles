-- local ts_parsers = {
--     "svelte",
--     "typescript",
--     "javascript",
--     "bash",
--     "css",
--     "lua",
--     "fish",
--     "prisma",
--     "graphql",
--     "json",
-- }
--
-- require("nvim-treesitter").install(ts_parsers)

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})

vim.o.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
