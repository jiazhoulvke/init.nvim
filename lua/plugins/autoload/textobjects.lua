local use = require("packer").use
-- Create your own text objects
use "kana/vim-textobj-user"
-- Text objects for dealing with URIs. *u*
use "jceb/vim-textobj-uri"
-- Text objects for date and time. *da*, *dd*, *df*, *dt*, *dz*
use "kana/vim-textobj-datetime"
-- Text objects for entire buffer. *e*
use "kana/vim-textobj-entire"
-- Text objects for foldings. *z*
use "kana/vim-textobj-fold"
-- Text objects for indented blocks of lines. *i*, *I*
use "kana/vim-textobj-indent"
-- Vim plugin that provides additional text objects: ({[<t(tags)
use "wellle/targets.vim"
-- Vim text objects for comments. *c*
use "glts/vim-textobj-comment"
-- Defines text objects to target text after the designated characters.
use {
	"junegunn/vim-after-object",
	config = function()
		vim.cmd([[
		autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
		]])
	end,
}

