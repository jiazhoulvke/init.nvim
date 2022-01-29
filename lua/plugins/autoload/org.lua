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

use {
    "lukas-reineke/headlines.nvim",
	requires = "nvim-orgmode/orgmode",
    config = function()
        require("headlines").setup {
            markdown = {
                source_pattern_start = "^```",
                source_pattern_end = "^```$",
                dash_pattern = "^---+$",
                headline_pattern = "^#+",
                headline_highlights = {"Headline"},
                codeblock_highlight = "CodeBlock",
                dash_highlight = "Dash"
            },
            rmd = {
                source_pattern_start = "^```",
                source_pattern_end = "^```$",
                dash_pattern = "^---+$",
                headline_pattern = "^#+",
                headline_signs = {"Headline"},
                codeblock_sign = "CodeBlock",
                dash_highlight = "Dash"
            },
            vimwiki = {
                source_pattern_start = "^{{{%a+",
                source_pattern_end = "^}}}$",
                dash_pattern = "^---+$",
                headline_pattern = "^=+",
                headline_highlights = {"Headline"},
                codeblock_highlight = "CodeBlock",
                dash_highlight = "Dash"
            },
            org = {
                source_pattern_start = "#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]",
                source_pattern_end = "#%+[eE][nN][dD]_[sS][rR][cC]",
                dash_pattern = "^-----+$",
                headline_pattern = "^%*+",
                headline_highlights = {"Headline"},
                codeblock_highlight = "CodeBlock",
                dash_highlight = "Dash"
            }
        }
    end
}
