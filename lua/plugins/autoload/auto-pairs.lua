local use = require("packer").use

use {
    "jiangmiao/auto-pairs",
}

vim.cmd([[
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''
]])
