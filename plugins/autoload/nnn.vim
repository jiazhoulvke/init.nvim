" file explorer
Plug 'mcchrish/nnn.vim'

" Opens the n³ window in a split
let g:nnn#layout = 'new' " or vnew, tabnew etc.

" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~15%' } " or right, up, down

" Floating window. This is the default
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Comment' } }

let g:nnn#set_default_mappings = 0
nnoremap <silent>\n <cmd>NnnExplorer<CR>
