" A vim plugin that adds some nice extra's for working with markdown documents
Plug 'SidOfc/mkdx', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & npm install'}
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'masukomi/vim-markdown-folding'

" 需要在markdown文件中高亮的代码
let g:markdown_fenced_languages = ['bash=sh', 'c', 'ini=dosini', 'go', 'mysql', 'php', 'py=python', 'python', 'sh', 'sql', 'vim']

" mkdx: {{{
if !exists('g:mkdx#settings')
	let g:mkdx#settings = {}
endif
let g:mkdx#settings.highlight = { 'enable': 1 }
let g:mkdx#settings.links = { 'external': { 'enable': 1 } }
let g:mkdx#settings.toc = { 'text': 'Table of Contents', 'update_on_write': 1 }
let g:mkdx#settings.map = { 'enable': 0 }
let g:mkdx#settings.fold = { 'enable': 0 }

function! s:toggleMarkdownListItemCheckbox()
	let sID = synID(line('.'), col('.'), 1)
	let sName = synIDattr(sID, 'name')
	if sName != 'mkdListItemLine' && sName != 'mkdListItem'
		return
	endif
	if match(getline('.'), '^\s*[\*\-] \[[ -x]\] ') > -1
		call mkdx#ToggleCheckboxState()
	else
		call mkdx#ToggleCheckboxTask()
	endif
endfunction

function! s:markdownSettings()
	" nnoremap<silent><buffer> <C-space> :call <SID>toggleMarkdownListItemCheckbox()<CR>
	nnoremap<silent><buffer> <C-t> :call mkdx#ToggleCheckboxTask()<CR>
endfunction

autocmd! BufNew,BufRead *.md call s:markdownSettings()
" }}}

" markdown preview plugin for (neo)vim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0

" vim-markdown {{{
let g:vim_markdown_fenced_languages = g:markdown_fenced_languages
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_conceal = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
" }}}

" vim-markdown-folding: {{{
" autocmd FileType markdown set foldexpr=StackedMarkdownFolds()
autocmd FileType markdown setlocal foldexpr=NestedMarkdownFolds()
" }}}
