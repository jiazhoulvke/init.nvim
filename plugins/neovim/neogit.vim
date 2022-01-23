" magit for neovim
Plug 'TimUntersberger/neogit'

lua << EOF
local neogit = require('neogit')

neogit.setup {
  integrations = {
    diffview = true,
  },
}
EOF

nnoremap <silent><leader>gg <ESC>:Neogit<CR>
