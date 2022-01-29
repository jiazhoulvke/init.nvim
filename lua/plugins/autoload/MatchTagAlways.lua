-- tag配对显示
local use = require("packer").use
use {
      'Valloric/MatchTagAlways',
      ft = { 'html','xhtml', 'xml', 'vue'},
}

vim.g.mta_filetypes = {html=1,  xhtml=1,  xml=1, vue=1}
