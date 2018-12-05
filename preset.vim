" cycle colorscheme {{{1
let g:myvimrc_colorschemes = ['gruvbox', 'NeoSolarized', 'flattened_dark']
if !exists('g:myvimrc_colorscheme_index')
	let g:myvimrc_colorscheme_index = 0
endif

let g:neosolarized_termtrans = 1 " NeoSolarized背景透明

func! ChangeColorscheme()
	if g:myvimrc_colorscheme_index < len(g:myvimrc_colorschemes)-1
		let g:myvimrc_colorscheme_index+=1
	else
		let g:myvimrc_colorscheme_index = 0
	endif
	exec 'colo '.g:myvimrc_colorschemes[g:myvimrc_colorscheme_index]
	echo g:myvimrc_colorscheme_index
	set background=dark
endfunc
nmap <F2> <ESC>:call ChangeColorscheme()<CR>
" }}}

" disable builtin plugins {{{1
let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_matchparen = 1
let g:loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
" }}}

" vim: foldmethod=marker
