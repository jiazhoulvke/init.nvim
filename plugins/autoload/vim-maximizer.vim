" Maximizes and restores the current window in Vim.
Plug 'szw/vim-maximizer', {'on': 'MaximizerToggle'}

let g:maximizer_set_default_mapping = 0
nnoremap <silent><leader>zz <cmd>MaximizerToggle<CR>
