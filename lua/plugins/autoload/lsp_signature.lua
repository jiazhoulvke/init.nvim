-- LSP signature hint as you type
local use = require("packer").use
use {
	'ray-x/lsp_signature.nvim',
	config = function()
		require "lsp_signature".setup()
	end,
}

