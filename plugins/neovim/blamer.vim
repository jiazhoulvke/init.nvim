" A git blame plugin for neovim inspired by VS Code's GitLens plugin
Plug 'APZelos/blamer.nvim'

let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 1
let g:blamer_prefix = ' '
let g:blamer_template = '<committer-time> • <summary>, <committer>'
let g:blamer_relative_time = 1
highlight Blamer guifg=yellow
