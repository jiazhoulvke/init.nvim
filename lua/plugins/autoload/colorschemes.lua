local use = require("packer").use

-- gruvbox
use {
    "morhetz/gruvbox",
    config = function()
        vim.g.gruvbox_italic = 1
        vim.g.gruvbox_contrast_dark = "soft"
    end
}

-- one
use "rakr/vim-one"

-- onedark
use {
    "navarasu/onedark.nvim",
    config = function()
        require("onedark").setup {
            -- Main options --
            style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false, -- Show/hide background
            term_colors = true, -- Change terminal color as per the selected theme style
            ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
            -- toggle theme style ---
            toggle_style_key = "<leader>ccs", -- Default keybinding to toggle
            toggle_style_list = {"dark", "darker", "cool", "deep", "warm", "warmer", "light"}, -- List of styles to toggle between
            -- Change code style ---
            -- Options are italic, bold, underline, none
            -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
            code_style = {
                comments = "italic",
                keywords = "none",
                functions = "none",
                strings = "none",
                variables = "none"
            },
            -- Custom Highlights --
            colors = {}, -- Override default colors
            highlights = {}, -- Override highlight groups
            -- Plugins Config --
            diagnostics = {
                darker = true, -- darker colors for diagnostic
                undercurl = true, -- use undercurl instead of underline for diagnostics
                background = true -- use background color for virtual text
            }
        }
    end
}

-- Comfortable & Pleasant Color Scheme for Vim
use 'sainnhe/everforest'
