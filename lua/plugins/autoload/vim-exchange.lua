-- 用cxiw交换单词、cxi'交换‘中的文字等

local use = require("packer").use
use {
    "tommcdo/vim-exchange",
    cmd = {"<Plug>(ExchangeLine)", "<Plug>(Exchange)"}
}

vim.cmd(
    [[
let g:exchange_no_mappings = 1
nmap cxx <Plug>(ExchangeLine)
nmap cxc <Plug>(ExchangeClear)
nmap cx <Plug>(Exchange)
xmap X <Plug>(Exchange)
]]
)
