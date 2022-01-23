if has('termguicolors')
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase', 'for': ['html', 'css', 'php', 'vue', 'conf', 'vim'] } " css颜色高亮
endif

if has('nvim')
	let g:Hexokinase_highlighters = ['virtual']
else
	let g:Hexokinase_highlighters = ['sign_column']
endif
