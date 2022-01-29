-- Extended session management for Vim (:mksession on steroids)
local use = require("packer").use
use {
    "xolox/vim-session",
    cmd = {"OpenSession", "SaveSession"}
}

vim.cmd(
    [[
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_directory = '~/.local/share/nvim/sessions'
nnoremap <leader>so <ESC>:OpenSession<CR>
]]
)
