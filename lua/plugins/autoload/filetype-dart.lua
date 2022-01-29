local use = require("packer").use

use {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
    config = function()
        vim.g.dart_format_on_save = 1
    end
}
