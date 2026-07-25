
vim.pack.add({
    { src = "https://github.com/luukvbaal/nnn.nvim" }
})

local nnn = require("nnn")
nnn.setup({
    quitcd = "cd"
})

vim.keymap.set("n", "<C-e>", function() vim.cmd [[NnnPicker %:p:h]] end)
