-- Delete all the buffers except the current, not modified and modifiable buffer.
local use = require("packer").use
use {"numToStr/BufOnly.nvim", cmd = {"BufOnly"}}

vim.cmd([[
nnoremap <silent><leader>xb <ESC>:BufOnly<CR>
]])
