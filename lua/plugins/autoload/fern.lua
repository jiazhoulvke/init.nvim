local use = require("packer").use
-- General purpose asynchronous tree viewer written in Pure Vim script
use "lambdalisue/fern.vim"
-- fern.vim plugin which add file type icon through nerdfont.vim
use "lambdalisue/fern-renderer-nerdfont.vim"
-- An universal palette for Nerd Fonts
use "lambdalisue/glyph-palette.vim"
-- Add Git status badge integration on file:// scheme on fern.vim
use "lambdalisue/fern-git-status.vim"
-- fern.vim plugin which add bookmark scheme
use "lambdalisue/fern-bookmark.vim"
-- Make fern.vim as a default file explorer instead of Netrw
use "lambdalisue/fern-hijack.vim"
-- Fundemental plugin to handle Nerd Fonts in Vim
use "lambdalisue/nerdfont.vim"
-- Add a file preview window to fern.vim.
use "yuki-yano/fern-preview.vim"

-- lambdalisue/fern.vim: {{{
vim.api.nvim_set_keymap("n", [[\\]], "<cmd>Fern . -drawer -toggle<CR>", {})
-- nmap \\ <ESC>:Fern . -drawer -toggle<CR>

vim.cmd(
    [[
function! s:init_fern() abort
  nmap <silent> <buffer> <2-LeftMouse> <Plug>(fern-action-open-or-expand)
  nmap <silent> <buffer> <RightMouse> <Plug>(fern-action-collapse)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

let g:fern#default_exclude = '^node_modules$'
]]
)
-- }}}

-- fern-bookmark.vim: {{{
vim.cmd([[ let g:fern#mapping#bookmark#disable_default_mappings = 0 ]])
-- }}}

-- lambdalisue/fern-renderer-nerdfont.vim: {{{
vim.cmd([[
let g:fern#renderer = "nerdfont"
let g:fern#renderer#nerdfont#leading = '  '
]])
-- }}}

-- lambdalisue/glyph-palette.vim: {{{
vim.cmd(
    [[
augroup my-glyph-palette
	autocmd! *
	autocmd FileType fern call glyph_palette#apply()
	autocmd FileType startify call glyph_palette#apply()
augroup END
]]
)
-- }}}

-- yuki-yano/fern-preview.vim: {{{
vim.cmd(
    [[
function! s:fern_settings() abort
  nmap <silent> <buffer> dd    <Plug>(fern-action-remove)
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
  nmap <silent> <buffer> R	   <Plug>(fern-action-reload)
  nmap <silent> <buffer> <C-r> <Plug>(fern-action-rename)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
function! s:fern_preview_window_width() abort
	let width = float2nr(&columns * 0.6)
	return width
endfunction

let g:fern_preview_window_calculator = {}
let g:fern_preview_window_calculator.width = function('s:fern_preview_window_width')
]]
)
-- }}}
