local use = require("packer").use
use {
  "dhruvasagar/vim-table-mode",
  ft = {"markdown", "org"},
  config = function()
    vim.g.table_mode_align_char = ":"
    vim.g.table_mode_always_active = 0
    vim.g.table_mode_corner = "|"
    vim.g.table_mode_corner_corner = "|"
    vim.g.table_mode_fillchar = "-"
    vim.g.table_mode_header_fillchar = "-"
    vim.g.table_mode_map_prefix = "\t"
    vim.g.table_mode_separator = "|"
    vim.g.table_mode_toggle_map = "m"
  end
}
