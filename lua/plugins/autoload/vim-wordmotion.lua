local use = require("packer").use

use {
  "chaoren/vim-wordmotion",
}

vim.cmd([[
let g:wordmotion_nomap = 1
nmap w          <Plug>WordMotion_w
nmap b          <Plug>WordMotion_b
]])
