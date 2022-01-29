local use = require("packer").use
use {
    "dhruvasagar/vim-table-mode",
    ft = {"markdown", "org"}
}

vim.cmd(
    [[
let g:table_mode_align_char = ":"
let g:table_mode_always_active = 0
let g:table_mode_corner = "|"
let g:table_mode_corner_corner = "|"
let g:table_mode_fillchar = '-'
let g:table_mode_header_fillchar = "-"
let g:table_mode_map_prefix = '\t'
let g:table_mode_separator = '|'
let g:table_mode_toggle_map = 'm'
]]
)
