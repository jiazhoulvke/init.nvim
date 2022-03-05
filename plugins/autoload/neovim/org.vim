" orgmode
Plug 'nvim-orgmode/orgmode'
Plug 'akinsho/org-bullets.nvim'

" orgmode: {{{
lua << EOF
require('orgmode').setup_ts_grammar()

require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {'org'},
		additional_vim_regex_highlighting = {'org'},
	},
}

require("orgmode").setup({
	-- org_agenda_files = {'~/Dropbox/Notes/*'},
	-- org_default_notes_file = '~/Dropbox/Notes/inbox.org',
	org_todo_keywords = {"TODO", "DOING", "|", "DONE"},
	org_blank_before_new_entry = {heading = false, plain_list_item = false}
})
EOF
" }}}

" org-bullets: {{{
lua << EOF
require("org-bullets").setup({
	symbols = {"◉", "○", "●", "◆", "✸", "•"}
})
EOF
" }}}

au FileType org setlocal conceallevel=2 concealcursor=nvc
