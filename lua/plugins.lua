-- vim: fdm=marker et ts=4
local home = vim.fn.fnamemodify(vim.fn.resolve(vim.fn.expand('<sfile>:p')), ':h')
local packer = require "packer"
local use = packer.use
packer.reset()

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap =
        vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(
    function()
        use "wbthomason/packer.nvim"
        local autoload_plugins = vim.fn.readdir(home..'/lua/plugins/autoload')
        for _,v in ipairs(autoload_plugins) do
            require('plugins.autoload.'..vim.fn.fnamemodify(v, ':r'))
        end

        if vim.fn.filereadable('./plugins_local.lua') then
            require('plugins_local')
        end

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
