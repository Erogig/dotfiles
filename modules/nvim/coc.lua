-- Add to ~/.config/nvim/init.lua
vim.g.coc_global_extensions = {
  -- 'coc-css',
  -- '@yaegassy/coc-tailwindcss3',
  -- 'coc-class-css',
  -- 'coc-docker',
  -- 'coc-html',
  -- 'coc-html-css-support',
  -- 'coc-java',
  -- 'coc-tsserver',
  -- 'coc-eslint',
  -- 'coc-luals',
  -- 'coc-make',
  -- 'coc-markdownlint',
  -- 'coc-prisma',
  -- 'coc-pyright',
  -- 'coc-sql',
  -- 'coc-sh',
  '@obergodmar/coc-svelte-language-tools',
  -- 'coc-toml',
  -- 'coc-yaml',
  }

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = 'yes'
vim.opt.laststatus = 2
 
-- Show coc.nvim status, including extension installation progress
vim.opt.statusline:prepend('%{coc#status()}')
 
local keyset = vim.keymap.set
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
 
-- Trigger completion with Tab and navigate the completion menu
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { silent = true, expr = true })
