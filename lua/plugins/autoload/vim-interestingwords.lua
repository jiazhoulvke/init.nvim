-- A vim plugin for highlighting and navigating through different words in a buffer.
local use = require("packer").use
use "lfv89/vim-interestingwords"

vim.cmd(
    [[
let g:interestingWordsDefaultMappings = 0
nnoremap <silent> <leader>kk :call InterestingWords('n')<CR>
vnoremap <silent> <leader>kk :call InterestingWords('v')<CR>
nnoremap <silent> <leader>kK :call UncolorAllWords('v')<CR>
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222', '33', '66', '99', '170']
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#ff6600', '#333399','#ee9933','#aa6622','#ffffff']
]]
)
