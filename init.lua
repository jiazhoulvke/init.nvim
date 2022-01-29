-- 预设
if vim.fn.filereadable('./lua/preset.lua') then
	require('preset')
end

-- 基础设置
require("basic")

-- 按键设置
require("keymaps")

-- 插件
require("plugins")

-- 样式
require("style")

if vim.fn.filereadable('./init_local.lua') then
	require('init_local')
end
