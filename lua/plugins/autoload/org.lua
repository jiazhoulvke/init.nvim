-- orgmode
local use = require("packer").use

use {
    "nvim-orgmode/orgmode",
    config = function()
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.org = {
            install_info = {
                url = "https://github.com/milisims/tree-sitter-org",
                revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
                files = {"src/parser.c", "src/scanner.cc"}
            },
            filetype = "org"
        }

        require("orgmode").setup(
            {
                -- org_agenda_files = {'~/Dropbox/Notes/*'},
                -- org_default_notes_file = '~/Dropbox/Notes/inbox.org',
                org_todo_keywords = {"TODO", "DOING", "|", "DONE"},
                org_blank_before_new_entry = {heading = false, plain_list_item = false}
            }
        )
    end
}

use {
    "akinsho/org-bullets.nvim",
	requires = "nvim-orgmode/orgmode",
    config = function()
        require("org-bullets").setup(
            {
                symbols = {"◉", "○", "●", "◆", "✸", "•"}
            }
        )
    end
}

vim.cmd([[
au FileType org setlocal conceallevel=2 concealcursor=nvc
]])
