" Delete all the buffers except the current, not modified and modifiable buffer.
Plug 'numToStr/BufOnly.nvim', {'on': ['BufOnly']}

nnoremap <silent><leader>xb <ESC>:BufOnly<CR>
