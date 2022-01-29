local use = require("packer").use

use "nvim-lualine/lualine.nvim"
use "arkav/lualine-lsp-progress"

-- 如果安装了nvim-gps则显示
-- local gps = require("nvim-gps")
local my_lualine_c = {"filename", "lsp_progress"}
-- if vim.fn.PluginIsLoaded("nvim-gps") == 1 then
--     table.insert(my_lualine_c, 2, {gps.get_location, cond = gps.is_available})
-- end

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = {
            {
                "mode",
                fmt = function(str)
                    return str:sub(1, 1)
                end
            }
        },
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = my_lualine_c,
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {"quickfix", "fern", "fugitive"}
}
