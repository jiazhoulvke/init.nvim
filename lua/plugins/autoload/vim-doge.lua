-- DoGe is a (Do)cumentation (Ge)nerator which will generate a proper
-- documentation skeleton based on certain expressions (mainly functions).
local use = require("packer").use
use {
    "kkoomen/vim-doge",
    run = "call doge#install()",
    config = function()
        vim.g.doge_mapping_comment_jump_forward = "<M-.>"
        vim.g.doge_mapping_comment_jump_backward = "<M-,>"
    end
}
