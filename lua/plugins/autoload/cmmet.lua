-- emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
local use = require("packer").use
use {
    "mattn/emmet-vim",
    ft = {"html", "xml", "vue"}
}
