" Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
Plug 'numToStr/Comment.nvim'

if !has('nvim-0.6')
	finish
endif

lua <<EOF
require('Comment').setup()
EOF
