-- 文件内容查找
local use = require("packer").use

use {
    "dyng/ctrlsf.vim",
    cmd = "CtrlSF"
}

vim.cmd([[
nnoremap <leader>sf <ESC>:CtrlSF<space>
nnoremap <leader>st <ESC>:CtrlSFToggle<CR>
]])
