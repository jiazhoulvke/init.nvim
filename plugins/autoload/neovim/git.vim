" magit for neovim
Plug 'TimUntersberger/neogit'

lua << EOF
local neogit = require("neogit")

neogit.setup {
	integrations = {
		diffview = true
	}
}
EOF

nnoremap <silent><leader>gg <ESC>:Neogit<CR>

" A git blame plugin for neovim inspired by VS Code's GitLens plugin
Plug 'APZelos/blamer.nvim'

let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 1
let g:blamer_prefix = ' '
let g:blamer_template = '<committer-time> • <summary>, <committer>'
let g:blamer_relative_time = 1
highlight Blamer guifg=yellow

" Git integration for buffers
Plug 'lewis6991/gitsigns.nvim'
lua require("gitsigns").setup()

nnoremap ]c <cmd>Gitsigns next_hunk<CR>
nnoremap [c <cmd>Gitsigns prev_hunk<CR>

nnoremap <leader>gsh <cmd>Gitsigns stage_hunk<CR>
nnoremap <leader>gsb <cmd>Gitsigns stage_buffer<CR>

" text object
vnoremap vih <cmd>Gitsigns select_hunk<CR>
