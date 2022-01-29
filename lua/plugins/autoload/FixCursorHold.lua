-- Fix CursorHold Performance.
local use = require("packer").use
use 'antoinemadec/FixCursorHold.nvim'

vim.g.cursorhold_updatetime = 100
