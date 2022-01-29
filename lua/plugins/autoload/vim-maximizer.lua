-- Maximizes and restores the current window in Vim.
local use = require("packer").use
use {
    "szw/vim-maximizer",
    cmd = "MaximizerToggle"
}

vim.cmd([[
let g:maximizer_set_default_mapping = 0
nnoremap <silent><leader>zz <cmd>MaximizerToggle<CR>
]])
