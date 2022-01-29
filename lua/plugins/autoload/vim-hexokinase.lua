-- css颜色高亮
local use = require("packer").use
use {
    "RRethy/vim-hexokinase",
    run = "make hexokinase",
    ft = {"html", "css", "php", "vue", "conf", "vim"},
	config = function()
		vim.cmd([[
		let g:Hexokinase_highlighters = ['virtual']
		]])
	end,
}

