" A generic and modular lua sidebar for Neovim
Plug 'sidebar-nvim/sidebar.nvim'

lua <<EOF
local sidebar = require("sidebar-nvim")
sidebar.setup()
EOF
