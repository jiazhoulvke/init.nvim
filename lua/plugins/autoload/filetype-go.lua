local use = require("packer").use

use {
    "fatih/vim-go",
    ft = "go",
	config = function()
		vim.g.go_def_mode = "gopls"
		vim.g.go_info_mode = "gopls"
		vim.g.go_auto_type_info = 0
		vim.g.go_updatetime = 500
		vim.g.go_diagnostics_level = 2
		vim.g.go_list_autoclose = 1
		vim.g.go_term_enabled = 1
		vim.g.go_def_mapping_enabled = 0
		vim.g.go_gocode_propose_builtins = 0
		vim.g.go_gocode_propose_source = 0
		vim.g.go_gocode_socket_type = "unix"
		vim.g.go_doc_balloon = 1
		vim.g.go_doc_popup_window = 0
		vim.g.go_echo_go_info = 1
		vim.g.go_echo_command_info = 0
		vim.g.go_fmt_fail_silently = 0
		vim.g.go_gocode_unimported_packages = 0
	end,
}

-- 高亮golang包名
use {
    "tweekmonster/hl-goimport.vim",
    ft = "go"
}

