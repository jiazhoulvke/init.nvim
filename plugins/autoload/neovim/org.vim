" orgmode
Plug 'nvim-orgmode/orgmode'

lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
		files = {"src/parser.c", "src/scanner.cc"}
	},
	filetype = "org"
}

require("orgmode").setup({
	-- org_agenda_files = {'~/Dropbox/Notes/*'},
	-- org_default_notes_file = '~/Dropbox/Notes/inbox.org',
	org_todo_keywords = {"TODO", "DOING", "|", "DONE"},
	org_blank_before_new_entry = {heading = false, plain_list_item = false}
})
EOF

Plug 'akinsho/org-bullets.nvim'

Plug 'nvim-orgmode/orgmode'

lua << EOF
require("org-bullets").setup({
	symbols = {"◉", "○", "●", "◆", "✸", "•"}
})
EOF

au FileType org setlocal conceallevel=2 concealcursor=nvc
