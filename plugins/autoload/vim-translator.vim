Plug 'voldikss/vim-translator', { 'on': ['Translate', 'TranslateW', 'TranslateWV', '<Plug>TranslateW', '<Plug>TranslateWV'] } " (Neo)Vim translation plugin

let g:vtm_default_mapping = 0
let g:vtm_default_engines = ['bing', 'google', 'haici', 'sdcv', 'trans', 'youdao']

nmap <silent> <leader>fy <Plug>TranslateW
vmap <silent> <leader>fy <Plug>TranslateWV
