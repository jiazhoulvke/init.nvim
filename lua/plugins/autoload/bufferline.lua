-- 标签栏
local use = require("packer").use
use {
    "akinsho/bufferline.nvim",
	event = "BufReadPre",
    config = function()
        require("bufferline").setup {
            options = {
                numbers = "none",
                -- numbers = function(opts)
                -- 	-- return string.format('%s', opts.raise(opts.ordinal))
                -- end,
                close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
                middle_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                indicator_icon = "▎",
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
                    -- remove extension from markdown files for example
                    if buf.name:match("%.md") then
                        return vim.fn.fnamemodify(buf.name, ":t:r")
                    end
                end,
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = true,
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                separator_style = "slant", -- or "thin" or "thick"
                enforce_regular_tabs = false,
                always_show_bufferline = false,
                -- sort_by = 'id', -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                tab_size = 1
                -- diagnostics = vim.g.bufferline_diagnostics,
            }
        }
        vim.cmd(
            [[
		" 切换标签页
		nnoremap <silent><leader>ts <cmd>BufferLinePick<CR>

		nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
		nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
		nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
		nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
		nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
		nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
		nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
		nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
		nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

		" 左右切换标签页
		nnoremap <silent>[b <cmd>BufferLineCyclePrev<CR>
		nnoremap <silent>]b <cmd>BufferLineCycleNext<CR>

		" 左右移动标签页
		noremap <silent><m-left> <cmd>BufferLineMovePrev<CR>
		noremap <silent><m-right> <cmd>BufferLineMoveNext<CR>
		]]
        )
    end
}
