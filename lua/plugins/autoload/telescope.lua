-- Find, Filter, Preview, Pick. All lua, all the time.

local use = require("packer").use

use "nvim-telescope/telescope.nvim"
-- A telescope.nvim extension that offers intelligent prioritization when selecting files from your editing history.
use "nvim-telescope/telescope-frecency.nvim"
-- Integration for asynctasks with telescope.nvim
use "GustavoKatel/telescope-asynctasks.nvim"
use "AckslD/nvim-neoclip.lua"

-----------------------------------------------------------------------
-- extensions
-----------------------------------------------------------------------

-- telescope-frecency.nvim
require("telescope").load_extension("frecency")
-- telescope-asynctasks.nvim

------------------------------------------------------------------------
-- telescope
------------------------------------------------------------------------
local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<M-n>"] = actions.move_selection_next,
                ["<M-p>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<Esc>"] = actions.close,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                ["<C-w>"] = {"<c-s-w>", type = "command"}
            },
            n = {
                ["<Esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                -- TODO: This would be weird if we switch the ordering.
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["?"] = actions.which_key
            }
        }
    }
}

vim.cmd(
    [[
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ht <cmd>Telescope help_tags<cr>
]]
)

-- telescope-frecency
vim.cmd([[
nnoremap <leader>fh <cmd>Telescope frecency<cr>
]])

-- telescope-asynctasks
vim.cmd([[
nnoremap <leader>ft <ESC>:lua require('telescope').extensions.asynctasks.all()<CR>
]])

-- nvim-neoclip
require("neoclip").setup()
require("telescope").load_extension("neoclip")
