Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown', 'org'] }

let g:table_mode_always_active = 0
let g:table_mode_disable_mappings = 0
let g:table_mode_align_char = ':'
let g:table_mode_corner = '|'
let g:table_mode_corner_corner = '|'
let g:table_mode_fillchar = '-'
let g:table_mode_header_fillchar = '-'
let g:table_mode_map_prefix = '\t'
let g:table_mode_separator = '|'
let g:table_mode_toggle_map = 'm'

if !exists('g:vim_table_mode_disable')
	augroup TableModeAutoEnable
		au!
		au FileType markdown TableModeEnable
	augroup END
endif
