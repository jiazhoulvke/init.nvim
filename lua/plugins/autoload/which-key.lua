-- displays a popup with possible key bindings of the
-- command you started typing
local use = require("packer").use
use {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup{}
	end,
}

