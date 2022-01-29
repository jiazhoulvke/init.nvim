------------------------------------------------------------------------
--
-- style.lua - 显示样式设置
--
------------------------------------------------------------------------
-- vim: set ts=4 sw=4 tw=78 noet :

------------------------------------------------------------------------
-- 显示设置
------------------------------------------------------------------------

-- 总是显示状态栏
vim.o.laststatus = 2

-- 总是显示行号
vim.o.number = true

-- 显示标号栏（用于显示 mark/gitdiff/诊断信息）
vim.o.signcolumn = "auto"

-- 开启相对行号
vim.o.relativenumber = true

-- 不显示当前状态
vim.o.showmode = false

-- 设置显示制表符等隐藏字符
vim.o.list = true

-- 不高亮当前行
vim.o.cursorline = false

-- 完全不显示隐藏文本
vim.o.conceallevel = 2

-- 关掉一些烦人的信息
vim.opt.shortmess:append("c")

-- 右下角显示命令
vim.o.showcmd = true

-- 水平切割窗口时，默认在右边显示新窗口
vim.o.splitright = true

------------------------------------------------------------------------
-- 颜色主题
------------------------------------------------------------------------

-- 设置黑色背景
vim.o.background = "dark"

-- 开启真彩色
vim.o.termguicolors = true

-- 设置颜色主题
if vim.g.use_colorscheme ~= nil then
    vim.cmd([[exec 'colorscheme ' g:use_colorscheme]])
else
    vim.cmd([[colo desert]])
end

------------------------------------------------------------------------
-- quickfix 设置，隐藏行号
------------------------------------------------------------------------
vim.cmd([[
augroup VimInitStyle
	au!
	au FileType qf setlocal nonumber
augroup END
]])
