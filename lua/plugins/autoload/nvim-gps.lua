-- Simple statusline component that shows what scope you are working inside
local use = require("packer").use
use {
    "SmiteshP/nvim-gps",
    config = function()
        require("nvim-gps").setup(
            {
                disable_icons = false, -- Setting it to true will disable all icons
                icons = {
                    ["class-name"] = " ", -- Classes and class-like objects
                    ["function-name"] = " ", -- Functions
                    ["method-name"] = " ", -- Methods (functions inside class-like objects)
                    ["container-name"] = "⛶ ", -- Containers (example: lua tables)
                    ["tag-name"] = "" -- Tags (example: html tags)
                },
                languages = {
                    ["json"] = {
                        icons = {
                            ["array-name"] = " ",
                            ["object-name"] = " ",
                            ["null-name"] = "[] ",
                            ["boolean-name"] = "ﰰﰴ ",
                            ["number-name"] = "# ",
                            ["string-name"] = " "
                        }
                    },
                    ["yaml"] = {
                        icons = {
                            ["mapping-name"] = " ",
                            ["sequence-name"] = " ",
                            ["null-name"] = "[] ",
                            ["boolean-name"] = "ﰰﰴ ",
                            ["integer-name"] = "# ",
                            ["float-name"] = " ",
                            ["string-name"] = " "
                        }
                    }
                    -- ['bash'] = false,
                },
                -- separator = ' > ',
                separator = "  ",
                depth = 0,
                depth_limit_indicator = ".."
            }
        )
    end
}
