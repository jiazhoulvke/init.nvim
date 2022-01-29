-- 代码补全
local use = require("packer").use

vim.g.bufferline_diagnostics = "coc"

use {
    "neoclide/coc.nvim",
    branch = "release"
}

vim.cmd(
    [[
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? coc#_select_confirm() :
	      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()

	function! s:check_back_space() abort
		  let col = col('.') - 1
		    return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

	let g:coc_snippet_next = '<C-j>'
	let g:coc_snippet_prev = '<C-k>'

	" Use `[d` and `]d` to navigate diagnostics
	nnoremap <silent> [d <Plug>(coc-diagnostic-prev)
	nnoremap <silent> ]d <Plug>(coc-diagnostic-next)

	" Remap keys for gotos
	nnoremap <silent> gd <Plug>(coc-definition)
	nnoremap <silent> gy <Plug>(coc-type-definition)
	nnoremap <silent> gi <Plug>(coc-implementation)
	nnoremap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" Remap for rename current word
	nnoremap <leader>rn <Plug>(coc-rename)

	" format
	xnoremap <leader>f <Plug>(coc-format-selected)
	vnoremap <leader>f <Plug>(coc-format-selected)
	command! -nargs=0 Prettier :CocCommand prettier.formatFile

	nnoremap <leader>o <ESC>:call <SID>Outline()<CR>
	function! s:Outline()
	  if &filetype == 'go'
		exec ':GoDecls'
	  else
		exec ':CocList outline'
	  endif
	endfunction
	]]
)
