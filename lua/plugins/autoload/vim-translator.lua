local use = require("packer").use
use {
    "voldikss/vim-translator",
    cmd = {"Translate", "TranslateW", "TranslateWV", "<Plug>TranslateW", "<Plug>TranslateWV"}
}

vim.cmd(
    [[
let g:vtm_default_mapping = 0
let g:vtm_default_engines = ['bing', 'google', 'haici', 'sdcv', 'trans', 'youdao']

nmap <silent> <leader>fy <Plug>TranslateW
vmap <silent> <leader>fy <Plug>TranslateWV
]]
)
