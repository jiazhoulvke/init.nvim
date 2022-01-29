local use = require("packer").use
use "strboul/urlview.vim"

vim.cmd([[
nnoremap <silent> <leader>ou :Urlview<CR>
]])
