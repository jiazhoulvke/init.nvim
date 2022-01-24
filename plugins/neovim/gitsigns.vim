" Git integration for buffers
Plug 'lewis6991/gitsigns.nvim'

lua require('gitsigns').setup()

nnoremap ]c <cmd>Gitsigns next_hunk<CR>
nnoremap [c <cmd>Gitsigns prev_hunk<CR>

nnoremap <leader>gsh <cmd>Gitsigns stage_hunk<CR>
nnoremap <leader>gsb <cmd>Gitsigns stage_buffer<CR>

" text object
vnoremap vih <cmd>Gitsigns select_hunk<CR>
