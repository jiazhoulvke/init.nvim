local use = require("packer").use

-- All the lua functions I don't want to write twice.
use "nvim-lua/plenary.nvim"

-- SQLite/LuaJIT binding for lua and neovim
use "tami5/sqlite.lua"

-- An implementation of the Popup API from vim in Neovim
use "nvim-lua/popup.nvim"

-- A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
use "kyazdani42/nvim-web-devicons"
