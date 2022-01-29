-- Better whitespace highlighting for Vim
local use = require("packer").use
use "ntpeters/vim-better-whitespace"

vim.cmd([[
let g:better_whitespace_ctermcolor = 'yellow'
let g:better_whitespace_guicolor = 'orange'

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 0
]])
