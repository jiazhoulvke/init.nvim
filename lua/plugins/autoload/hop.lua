-- Neovim motions on speed!
local use = require("packer").use

use {
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
		require'hop'.setup()

		vim.cmd([[nnoremap <leader>jj <cmd>lua require'hop'.hint_char1()<CR>]])
        -- vim.api.nvim_set_keymap("n", "<leader>jj", "<cmd>lua require'hop'.hint_char1()<cr>", {})
        -- vim.api.nvim_set_keymap('n', '<leader>jl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
        -- vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
        -- vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
        -- vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
        -- vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
        -- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
        -- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
    end
}
