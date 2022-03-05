" Extended session management for Vim (:mksession on steroids)
Plug 'xolox/vim-session', { 'on': [ 'OpenSession', 'SaveSession' ] }

let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_directory = '~/.local/share/nvim/sessions'
nnoremap <leader>so <ESC>:OpenSession<CR>
