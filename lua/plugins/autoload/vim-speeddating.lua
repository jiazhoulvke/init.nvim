-- use CTRL-A/CTRL-X to increment dates, times, and more
local use = require("packer").use
use {
    "tpope/vim-speeddating",
    cmd = {"<Plug>SpeedDatingUp", "<Plug>SpeedDatingDown"}
}

vim.cmd([[
nmap <C-a> <Plug>SpeedDatingUp
nmap <C-x> <Plug>SpeedDatingDown
]])
