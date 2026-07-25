
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzy-native.nvim" },
    -- { src = "https://github.com/kkharji/sqlite.lua" },
    { src = "https://github.com/danielfalk/smart-open.nvim"},
})

local telescope = require "telescope"
local telescope_actions = require "telescope.actions"
local tele_builtin = require "telescope.builtin"
local tele_theme_dropdown = require "telescope.themes".get_dropdown()
local tele_theme_default = {}

function dynamic_theme()
    local width = vim.api.nvim_win_get_width(0)
    local height = vim.api.nvim_win_get_height(0)

    if width / 2 > height then
        return tele_theme_default
    else
        return tele_theme_dropdown
    end
end

local theme = dynamic_theme

telescope.setup {
    defaults = {
        mappings = { i = { ["<esc>"] = telescope_actions.close }
        }
    },
    extensions = {
        smart_open = { result_limit = 100 },
        fzy_native = {},
    }
}

telescope.load_extension("smart_open")

vim.keymap.set("n", "<C-p>", function() telescope.extensions.smart_open.smart_open() end)
vim.keymap.set("n", "<C-g>", function() tele_builtin.live_grep(theme()) end)
-- vim.keymap.set("n", "<C-e>", function() tele_builtin.treesitter(theme()) end)
vim.keymap.set("n", "<C-A-p>", function() tele_builtin.grep_string(theme()) end)
vim.keymap.set("n", "S", function() tele_builtin.spell_suggest(theme()) end)
vim.keymap.set("n", "<C-/>", function() tele_builtin.current_buffer_fuzzy_find(theme()) end)
