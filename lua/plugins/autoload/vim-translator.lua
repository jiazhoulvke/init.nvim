local use = require("packer").use
use {
    "voldikss/vim-translator",
    keys = {"<leader>fy"},
    config = function()
        vim.cmd([[
        let g:vtm_default_mapping = 0
        let g:vtm_default_engines = ['bing', 'google', 'haici', 'sdcv', 'trans', 'youdao']

        nmap <silent> <leader>fy <Plug>TranslateW
        vmap <silent> <leader>fy <Plug>TranslateWV
        ]])
    end
}
