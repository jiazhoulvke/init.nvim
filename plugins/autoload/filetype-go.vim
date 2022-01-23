Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tweekmonster/hl-goimport.vim', { 'for': 'go' } " 高亮golang包名

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 0
let g:go_updatetime = 500
let g:go_diagnostics_level = 2
let g:go_list_autoclose = 1
let g:go_term_enabled = 1
let g:go_def_mapping_enabled = 0
let g:go_gocode_propose_builtins = 0
let g:go_gocode_propose_source = 0
let g:go_gocode_socket_type = 'unix'
let g:go_doc_balloon = 1
let g:go_doc_popup_window = 0
let g:go_echo_go_info = 1
let g:go_echo_command_info = 0
let g:go_fmt_fail_silently = 0
let g:go_gocode_unimported_packages = 0
