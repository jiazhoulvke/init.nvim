local use = require("packer").use

-- 需要在markdown文件中高亮的代码
vim.g.markdown_fenced_languages = { 'bash=sh', 'c', 'ini=dosini', 'go', 'mysql', 'php', 'py=python', 'python', 'sh', 'sql', 'vim' } 

-- A vim plugin that adds some nice extra's for working with markdown documents
use {
	'SidOfc/mkdx',
	ft= 'markdown' ,
	config= function()
		vim.cmd([[
		if exists('g:mkdx#settings')
			let g:mkdx#settings = {
				\ 'map': { 'enable': 0 },
				\ 'enter': { 'enable': 0 }
			  \ }
		endif

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
			nnoremap<silent><buffer> <C-space> :call <SID>toggleMarkdownListItemCheckbox()<CR>
			nnoremap<silent><buffer> <C-t> :call mkdx#ToggleCheckboxTask()<CR>
		endfunction

		autocmd! BufNew,BufRead *.md call s:markdownSettings()
		]])
	end,
}

-- markdown preview plugin for (neo)vim
use {
	'iamcco/markdown-preview.nvim',
	ft= 'markdown',
	run= 'cd app & npm install',
	config = function()
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_auto_close = 0
	end,
}

use {
	'plasticboy/vim-markdown',
	ft = 'markdown',
	config = function()
		vim.g.vim_markdown_fenced_languages = vim.g.markdown_fenced_languages
		vim.g.vim_markdown_auto_insert_bullets = 0
		vim.g.vim_markdown_conceal = 1
		vim.g.vim_markdown_conceal_code_blocks = 0
		vim.g.vim_markdown_folding_disabled = 1
		vim.g.vim_markdown_follow_anchor = 1
		vim.g.vim_markdown_math = 1
		vim.g.vim_markdown_new_list_item_indent = 0
		vim.g.vim_markdown_no_default_key_mappings = 1
		vim.g.vim_markdown_toc_autofit = 1
	end,
}

