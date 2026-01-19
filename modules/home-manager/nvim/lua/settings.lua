local o = vim.o

o.termguicolors = true

o.number = true
o.relativenumber = true
o.signcolumn = 'yes:1'
o.cursorline = true
o.linebreak = true
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.clipboard = 'unnamedplus'

o.ignorecase = true
o.smartcase = true

vim.o.autochdir = true
