local home = vim.fn.fnamemodify(vim.fn.resolve(vim.fn.expand('<sfile>:p')), ':h')

-- 预设
if vim.fn.filereadable(home..'/lua/preset.lua')  == 1 then
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

-- 本地配置
if vim.fn.filereadable(home..'/lua/config_local.lua') == 1 then
  require('config_local')
end
