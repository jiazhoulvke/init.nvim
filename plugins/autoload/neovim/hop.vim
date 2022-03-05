" Neovim motions on speed!
Plug 'phaazon/hop.nvim', {'branch': 'v1'}

lua require'hop'.setup()

nnoremap <leader>jj <cmd>lua require'hop'.hint_char1()<CR>
