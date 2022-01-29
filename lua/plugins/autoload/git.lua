local use = require("packer").use

-- 对git的封装
use "tpope/vim-fugitive"

-- A Vim plugin which shows git diff markers in the sign column and
-- stages/previews/undoes hunks and partial hunks.
use "airblade/vim-gitgutter"

--  A better Vimdiff mergetool
use {
    "whiteinge/diffconflicts",
    cmd = "DiffConflicts"
}

-- magit for neovim
use {
    "TimUntersberger/neogit",
    config = function()
        local neogit = require("neogit")

        neogit.setup {
            integrations = {
                diffview = true
            }
        }

        vim.cmd([[
nnoremap <silent><leader>gg <ESC>:Neogit<CR>
]])
    end
}

-- A git blame plugin for neovim inspired by VS Code's GitLens plugin
use {
    "APZelos/blamer.nvim",
    config = function()
        vim.cmd(
            [[
let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 1
let g:blamer_prefix = ' '
let g:blamer_template = '<committer-time> • <summary>, <committer>'
let g:blamer_relative_time = 1
highlight Blamer guifg=yellow
]]
        )
    end
}

-- Git integration for buffers
use {
	'lewis6991/gitsigns.nvim',
	config = function()
		require('gitsigns').setup()

		vim.cmd([[
		nnoremap ]c <cmd>Gitsigns next_hunk<CR>
		nnoremap [c <cmd>Gitsigns prev_hunk<CR>

		nnoremap <leader>gsh <cmd>Gitsigns stage_hunk<CR>
		nnoremap <leader>gsb <cmd>Gitsigns stage_buffer<CR>

		" text object
		vnoremap vih <cmd>Gitsigns select_hunk<CR>
		]])
	end,
}
