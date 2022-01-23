Plug 'voldikss/vim-translate-me', { 'on': ['Translate', 'TranslateW', 'TranslateWV', '<Plug>TranslateW', '<Plug>TranslateWV'] } " (Neo)Vim translation plugin

let g:vtm_default_mapping = 0
let g:vtm_default_engines = ['youdao', 'ciba']
nmap <silent> <leader>fy <Plug>TranslateW
vmap <silent> <leader>fy <Plug>TranslateWV
