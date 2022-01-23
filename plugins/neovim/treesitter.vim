" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Refactor modules for nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter-refactor'
" textobjects modules for nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Show code context
Plug 'romgrk/nvim-treesitter-context'
" Rainbow parentheses for neovim using tree-sitter
Plug 'p00f/nvim-ts-rainbow'
" Use treesitter to auto close and auto rename html tag
Plug 'windwp/nvim-ts-autotag'

" nvim-treesitter: {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {'org'},
		additional_vim_regex_highlighting = {'org'},
	},
	-- 扩大选择区域
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			-- scope_incremental = "<C-h>",
			node_decremental = "<BS>",
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = false,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>",
			},
		},
	},
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}}

" p00f/nvim-ts-rainbow: {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
	rainbow = {
		enable = true,
		-- disable = {}, -- list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
}
EOF
" }}}

" romgrk/nvim-treesitter-context: {{{
if has('nvim-0.6')
lua <<EOF
require'treesitter-context'.setup{
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	throttle = true, -- Throttles plugin updates (may improve performance)
}
EOF
endif
" }}}


" windwp/nvim-ts-autotag: {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
	autotag = {
		enable = true,
	},
}
EOF
" }}}
