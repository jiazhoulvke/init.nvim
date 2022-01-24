" The neovim tabline plugin.
Plug 'romgrk/barbar.nvim'

nnoremap <silent>]b <cmd>BufferNext<cr>
nnoremap <silent>[b <cmd>BufferPrevious<cr>

noremap <silent><m-left> <cmd>BufferMovePrevious<cr>
noremap <silent><m-right> <cmd>BufferMoveNext<cr>

nnoremap <silent><leader>ts <cmd>BufferPick<cr>

nnoremap <silent><leader>1  <cmd>BufferGoto 1<cr>
nnoremap <silent><leader>2  <cmd>BufferGoto 2<cr>
nnoremap <silent><leader>3  <cmd>BufferGoto 3<cr>
nnoremap <silent><leader>4  <cmd>BufferGoto 4<cr>
nnoremap <silent><leader>5  <cmd>BufferGoto 5<cr>
nnoremap <silent><leader>6  <cmd>BufferGoto 6<cr>
nnoremap <silent><leader>7  <cmd>BufferGoto 7<cr>
nnoremap <silent><leader>8  <cmd>BufferGoto 8<cr>
nnoremap <silent><leader>9  <cmd>BufferGoto 9<cr>

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
let bufferline.animation = v:false

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
let bufferline.exclude_ft = []
let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = ''

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 1

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null


