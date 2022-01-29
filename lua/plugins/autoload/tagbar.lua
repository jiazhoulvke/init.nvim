local use = require("packer").use

use {
    "preservim/tagbar",
    cmd = "TagbarToggle",
	config = function()
		vim.cmd([[
		nnoremap <leader>tb <ESC>:TagbarToggle<CR>
		]])
	end,
}

