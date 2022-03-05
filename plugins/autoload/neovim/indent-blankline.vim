" Indent guides for Neovim
Plug 'lukas-reineke/indent-blankline.nvim'

lua << EOF
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
	show_end_of_line = true,
	space_char_blankline = " "
}
EOF
