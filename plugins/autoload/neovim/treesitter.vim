Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'
Plug 'romgrk/nvim-treesitter-context'

lua << EOF
-- Nvim Treesitter configurations and abstraction layer
require "treesitter-context".setup {
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	throttle = true -- Throttles plugin updates (may improve performance)
}

require "nvim-treesitter.configs".setup {
	highlight = {
		enable = true,
		disable = {"org"},
		additional_vim_regex_highlighting = {"org"}
	},
	-- 扩大选择区域
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			-- scope_incremental = "<C-h>",
			node_decremental = "<BS>"
		}
	},
	indent = {
		enable = false
	},
	rainbow = {
		enable = true,
		-- disable = {}, -- list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autotag = {
		enable = true
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
				["i,"] = "@parameter.inner",
				["a,"] = "@parameter.outer"
			}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["],"] = "@parameter.inner"
			},
			goto_previous_start = {
				["[,"] = "@parameter.inner"
			}
		},
		swap = {
			enable = true,
			swap_next = {
				["},"] = "@parameter.inner",
				["}f"] = "@function.outer"
			},
			swap_previous = {
				["{,"] = "@parameter.inner",
				["{f"] = "@function.inner"
			}
		}
	},
	context_commentstring = {
		enable = true
	},
	refactor = {
		highlight_definitions = {enable = true},
		highlight_current_scope = {enable = true},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr"
			}
		},
		navigation = {
			enable = false,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>"
			}
		}
	}
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
EOF
