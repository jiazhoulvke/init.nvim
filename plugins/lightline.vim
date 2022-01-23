Plug 'itchyny/lightline.vim'

if !exists('g:lightline')
	let g:lightline = {}
endif

let g:lightline['active'] = {
			\ 'left': [ ['mode', 'paste' ],
			\			[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\ }
let g:lightline['component_function'] = {
			\ 'gitbranch': 'FugitiveHead'
			\ }
