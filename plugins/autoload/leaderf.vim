Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" Yggdroot/LeaderF: {{{
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF='<leader>ff'
let g:Lf_ShortcutB='<leader>fb'
nnoremap <leader>ff <Esc>:Leaderf file<CR>
nnoremap <leader>fF <Esc>:Leaderf file --no-ignore<CR>
nnoremap <leader>hh <Esc>:Leaderf mru<CR>
nnoremap <leader>fg <Esc>:Leaderf rg<CR>
" }}}
