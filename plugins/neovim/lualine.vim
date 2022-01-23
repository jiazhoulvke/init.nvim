" 状态栏
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'

lua <<EOF
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'onedark',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { { 'mode', fmt = function(str) return str:sub(1,1) end } },
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename', 'lsp_progress'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {'quickfix', 'fern', 'fugitive'},
}

require('lualine').setup()
EOF