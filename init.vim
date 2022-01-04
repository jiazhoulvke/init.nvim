if !has('nvim')
	let $MY_VIM_PATH = $HOME.'/.vim'
else
	if has('win32')
		let $MY_VIM_PATH=$LOCALAPPDATA.'/nvim'
	else
		let $MY_VIM_PATH=$HOME.'/.config/nvim'
	endif
endif

if filereadable($MY_VIM_PATH.'/preset.vim')
	source $MY_VIM_PATH/preset.vim
endif

if filereadable($MY_VIM_PATH.'/preset_local.vim')
	source $MY_VIM_PATH/preset_local.vim
endif

let g:mapleader=' '

if exists('nvim-0.6')
	set foldmethod=expr
else
	set foldmethod=syntax
endif

" Plugins: {{{1
call plug#begin('~/.local/share/nvim/plugged')

" Misc: {{{2
if !has('nvim')
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
if exists('g:use_fcitx')
	Plug 'lilydjwg/fcitx.vim' " 自动切换中英文
endif
if exists('g:use_ibus')
	Plug 'jiazhoulvke/ibus-autoswitch.vim'
endif
if has('unix')
	Plug 'tpope/vim-eunuch' " Helpers for UNIX
endif
if exists('g:use_fern')
	Plug 'lambdalisue/fern.vim' " General purpose asynchronous tree viewer written in Pure Vim script
	Plug 'lambdalisue/fern-renderer-nerdfont.vim' " fern.vim plugin which add file type icon through nerdfont.vim
	Plug 'lambdalisue/glyph-palette.vim' " An universal palette for Nerd Fonts
	Plug 'lambdalisue/fern-git-status.vim' " Add Git status badge integration on file:// scheme on fern.vim
	Plug 'lambdalisue/fern-bookmark.vim' " fern.vim plugin which add bookmark scheme
	Plug 'lambdalisue/fern-hijack.vim' " Make fern.vim as a default file explorer instead of Netrw
	Plug 'lambdalisue/nerdfont.vim' " Fundemental plugin to handle Nerd Fonts in Vim
	Plug 'yuki-yano/fern-preview.vim' " Add a file preview window to fern.vim.
endif
Plug 'antoinemadec/FixCursorHold.nvim' " Fix CursorHold Performance.
Plug 'Valloric/MatchTagAlways', { 'for': ['html','xhtml', 'xml', 'vue'] } " tag配对显示
Plug 'itchyny/vim-cursorword' " Underlines the word under the cursor
Plug 'dhruvasagar/vim-zoom', { 'on': '<Plug>(zoom-toggle)' } " Toggle zoom in / out individual windows (splits) maps: <C-w>m
Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' } " 文件内容查找
Plug 'brooth/far.vim', { 'on': 'Far' } " Find And Replace Vim plugin
Plug 'inkarkat/vim-ingo-library' " Vimscript library of common functions
Plug 'lfv89/vim-interestingwords' " A vim plugin for highlighting and navigating through different words in a buffer.
Plug 'jiazhoulvke/vim-sleuth' " Heuristically set buffer options
Plug 'jiazhoulvke/vim-plug-helper.vim'
if exists('g:use_fzf_vim')
	Plug 'junegunn/fzf.vim'
endif
if exists('g:use_leaderf')
	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
endif
Plug 'junegunn/vim-after-object' " Defines text objects to target text after the designated characters.
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " 代码对齐
Plug 'kana/vim-textobj-user' " Create your own text objects
Plug 'glts/vim-textobj-comment' " Vim text objects for comments. *c*
Plug 'jceb/vim-textobj-uri' " Text objects for dealing with URIs. *u*
Plug 'kana/vim-textobj-datetime' " Text objects for date and time. *da*, *dd*, *df*, *dt*, *dz*
Plug 'kana/vim-textobj-entire' " Text objects for entire buffer. *e*
Plug 'kana/vim-textobj-fold' " Text objects for foldings. *z*
Plug 'kana/vim-textobj-function' " Text objects for functions. *f*
Plug 'kana/vim-textobj-indent' " Text objects for indented blocks of lines. *i*, *I*
Plug 'kana/vim-textobj-line' " Text objects for the current line. *l*
Plug 'kana/vim-textobj-syntax' " Text objects for syntax highlighted items. *y*
Plug 'sgur/vim-textobj-parameter' " Text object for parameter. *,*
Plug 'wellle/targets.vim' " Vim plugin that provides additional text objects: ({[<t(tags)
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } " The ultimate undo history visualizer for VIM
Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.
Plug 'preservim/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'sk1418/Join', { 'on': 'Join' } " 比vim自带的join更强大
Plug 'terryma/vim-expand-region' " 逐步扩大选择区域
Plug 'tommcdo/vim-exchange', { 'on': ['<Plug>(ExchangeLine)', '<Plug>(Exchange)'] } " 用cxiw交换单词、cxi'交换‘中的文字等
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-fugitive' " 对git的封装
Plug 'APZelos/blamer.nvim' " A git blame plugin for neovim inspired by VS Code's GitLens plugin
Plug 'strboul/urlview.vim'
Plug 'tpope/vim-repeat' " 重复执行操作
Plug 'tpope/vim-rsi' " Readline style insertion
Plug 'tpope/vim-speeddating', { 'on': ['<Plug>SpeedDatingUp', '<Plug>SpeedDatingDown'] } " use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround', { 'on': ['<Plug>Dsurround', '<Plug>Csurround', '<Plug>Yssurround', '<Plug>Ysurround', '<Plug>VSurround'] } " 对括号双引号等进行快速编辑
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'vim-scripts/LargeFile' " 针对大文件优化性能
Plug 'vim-scripts/VisIncr', { 'on': ['I', 'IA'] } " 列编辑
Plug 'vim-voom/VOoM', { 'on': ['Voom', 'VoomToggle'] } " 文档大纲
Plug 'voldikss/vim-translate-me', { 'on': ['Translate', 'TranslateW', 'TranslateWV', '<Plug>TranslateW', '<Plug>TranslateWV'] } " (Neo)Vim translation plugin
Plug 'w0rp/ale' " 异步代码检测
Plug 'wellle/targets.vim' " Vim plugin that provides additional text objects: ({[<t(tags)
Plug 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-session', { 'on': ['OpenSession', 'SaveSession'] } " Extended session management for Vim (:mksession on steroids)
Plug 'yianwillis/vimcdoc' " 中文帮助文档
Plug 'zhimsel/vim-stay' " 保持最后的编辑状态
Plug 'Lenovsky/nuake' " A Quake-style terminal panel for Neovim and Vim
Plug 'qpkorr/vim-renamer' " 以编辑文本的方式批量修改文件名
Plug 'liuchengxu/vim-which-key' " Vim plugin that shows keybindings in popup
Plug 'skywind3000/asynctasks.vim' " Modern Task System for Project Building, Testing and Deploying
Plug 'skywind3000/asyncrun.vim' " Run Async Shell Commands in Vim 8.0 / NeoVim and Output to the Quickfix Window
" }}}

" UI: {{{2
if exists('g:use_lightline')
	Plug 'itchyny/lightline.vim'
endif
if exists('g:use_airline')
	Plug 'bling/vim-airline' " beautiful status line
	Plug 'vim-airline/vim-airline-themes'
endif

"themes
Plug 'iCyMind/NeoSolarized' " colorscheme
Plug 'morhetz/gruvbox' " colorscheme
Plug 'rakr/vim-one'

Plug 'luochen1990/rainbow', { 'for':  ['python', 'javascript', 'jsx', 'html', 'css', 'go', 'vim', 'toml', 'lisp', 'scheme'], 'on': 'RainbowToggle' } " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
" }}}

" Languages: {{{2
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown', 'org'] }
" org {{{
if exists('g:use_org')
	Plug 'nvim-orgmode/orgmode'
	Plug 'akinsho/org-bullets.nvim'
endif
" }}}
" markdown-plugins: {{{3
if exists('g:use_markdown')
Plug 'SidOfc/mkdx', { 'for': 'markdown' } " A vim plugin that adds some nice extra's for working with markdown documents
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & npm install'} " markdown preview plugin for (neo)vim
Plug 'mzlogin/vim-kramdown-tab', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
endif
" }}}
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'lilydjwg/colorizer', { 'for': ['html', 'css', 'php', 'vue', 'conf', 'vim'] } " css颜色高亮
Plug 'cespare/vim-toml', { 'for': 'toml' } " toml语法插件
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'groenewege/vim-less', { 'for': 'less' } " less语法插件
Plug 'jansenm/vim-cmake', { 'for': 'cmake' }
Plug 'matze/vim-ini-fold', { 'for': ['dosini', 'ini'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " 更好的缩进
Plug 'tweekmonster/hl-goimport.vim', { 'for': 'go' } " 高亮golang包名
if has('nvim-0.6')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Nvim Treesitter configurations and abstraction layer
Plug 'romgrk/nvim-treesitter-context' " Show code context
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
endif
" }}}

" Completion: {{{2
if exists('g:use_coc')
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
endif
if exists('g:use_nvim_cmp')
	Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
	Plug 'hrsh7th/cmp-buffer' " nvim-cmp source for buffer words
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
	Plug 'hrsh7th/cmp-nvim-lua' " nvim-cmp source for nvim lua
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'rafamadriz/friendly-snippets'
	Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
endif
Plug 'fatih/vim-go', { 'for': 'go' } " golang补全

"}}}

if filereadable($MY_VIM_PATH.'/plugin_local.vim')
	source $MY_VIM_PATH/plugin_local.vim
endif

call plug#end()
" }}}

" Config: {{{1

" UI: {{{2
set number " 启用行号
set tabstop=4 " tab宽度设为4
" set softtabstop=4
set shiftwidth=4 " 换行宽度设为4
autocmd FileType python setlocal expandtab shiftwidth=4
set shortmess+=c " 关掉一些烦人的信息
set laststatus=2
set signcolumn=number
set noshowmode " 不显示当前状态
set display=lastline " 解决超长行显示异常的问题
set lazyredraw " 不立即重绘
set cursorline " 高亮当前行
set conceallevel=2
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set formatoptions+=m
" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''
if exists('g:use_truecolor')
	set termguicolors " 设置真彩色
endif
if exists('g:use_colorscheme')
	exec 'colorscheme ' g:use_colorscheme
else
	colorscheme gruvbox
endif
if has("gui_running")
	set guioptions-=m
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
endif

" 让背景在透明和不透明间切换 {{{
if !exists('g:background_is_transparent')
    let g:background_is_transparent = 0
endif
let g:background_guibg = ''
let g:background_ctermbg = ''
function! ToggleBackground()
    if g:background_is_transparent == 0
        let g:background_guibg = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
        let g:background_ctermbg = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
        hi Normal guibg=NONE ctermbg=NONE
        let g:background_is_transparent = 1
    else
        exe 'hi Normal guibg=' . g:background_guibg . ' ctermbg=' . g:background_ctermbg
        let g:background_is_transparent = 0
    endif
endfunction
nnoremap <silent> <leader>tt <ESC>:call ToggleBackground()<CR>
" }}}

" }}}

" Misc: {{{2
set fileencodings=utf-8,chinese,gbk,gb18030,gk2312,latin-1
set encoding=utf-8
if has('gui_running') && !has('nvim')
	if filereadable($VIMRUNTIME.'/delmenu.vim') && filereadable($VIMRUNTIME.'/menu.vim')
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
	endif
endif
set noerrorbells
set novisualbell
set nospell
if has('nvim')
	set inccommand=nosplit  " 命令更改会在原位置显示
endif
set smartindent " 智能缩进
set autoindent " 自动缩进
set ignorecase " 忽略大小写
set smartcase " 默认忽略大小写，除非包含大写字母
set smarttab " 智能tab
set hidden " 在当前buffer没有保存时可以切换到其他buffer
set undofile " 启用持久性撤销
set autoread " 自动读取改动的文件
set noswapfile " 不使用swapfile
set nobackup
set nowritebackup
set sessionoptions-=help " 保存session时不包括help信息
set whichwrap=b,s,<,>,[,]
set wildmode=list:full
set wildmenu
if has('mouse')
	set mouse=a " 如果鼠标可用则启用鼠标支持
endif
" 这里开头的^[必须用Ctrl+v ESC输入，不能直接复制粘贴!
" 另外Ctrl+Q可以替代Ctrl+v
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set isfname-== " 不将=当成文件名的一部分
if has('nvim')
	set viewdir=~/.local/share/nvim/view
else
	set viewdir=~/.vim/view
	set undodir=~/.vim/undo
endif

" }}}

" Bind: {{{2


" 翻页
nnoremap <M-d> <C-f>zz
nnoremap <M-e> <C-b>zz
nnoremap <M-n> <C-f>zz
nnoremap <M-p> <C-b>zz

" 在改变列表中移动
nnoremap <silent> g; g;zz
nnoremap <silent> g, g,zz

" 切换窗口
nnoremap <silent> <M-h> <C-w>h
nnoremap <silent> <M-j> <C-w>j
nnoremap <silent> <M-k> <C-w>k
nnoremap <silent> <M-l> <C-w>l
inoremap <silent> <M-h> <Esc><C-w>h
inoremap <silent> <M-j> <Esc><C-w>j
inoremap <silent> <M-k> <Esc><C-w>k
inoremap <silent> <M-l> <Esc><C-w>l
tnoremap <silent> <M-h> <C-\><C-n><C-w>h
tnoremap <silent> <M-j> <C-\><C-n><C-w>j
tnoremap <silent> <M-k> <C-\><C-n><C-w>k
tnoremap <silent> <M-l> <C-\><C-n><C-w>l

" 关闭窗口
nnoremap <M-c> <ESC>:close<CR>
inoremap <M-c> <ESC>:close<CR>

" 创建标签
nnoremap <leader>tn :tabnew<CR>

" 删除标签
nnoremap <leader>td :tabclose<CR>

" 切换tab
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" 保存
nnoremap <M-s> <ESC>:update<CR>
inoremap <M-s> <ESC>:update<CR>

" CTRL-X剪切
vmap <C-X> "+x

" Ctrl+C复制
vmap <C-C> "+y

function! MyPaste() abort
	set paste
    exe "normal \"+gP"
	set nopaste
endfunction

" CTRL-V粘贴
vmap <C-V> "+gp
imap <C-v> <C-r>+
cmap <C-v> <C-r>+
nnoremap <C-v> <ESC>:call MyPaste()<CR>

" 列选择模式
nnoremap vv <C-Q>

" 普通模式下复制文件路径
nnoremap <C-c> :let @+=expand('%:p')<CR>

" 插入模式下上开一行
inoremap <M-cr> <Esc>O

" 删除后面的字符
inoremap <C-d> <DEL>

" 删除一个词
inoremap <M-BS> <C-w>

" 用Tab缩进
nnoremap <Tab> v>
nnoremap <S-Tab> v<
vnoremap <Tab> >
vnoremap <S-Tab> <

" Ctrl+方向键调整窗口大小
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>

" 用'切换折叠状态
nnoremap ' za

" 进入当前buffer所在目录
nnoremap <leader>cd <ESC>:cd %:p:h<CR>

" 删除^M
nnoremap <leader>dm <ESC>:%s/\r$//<CR>

" 删除空行
nnoremap <Leader>dbl :g/^\s*$/d<CR>

" json格式化
nnoremap <leader>jq <ESC>:%!jq '.'<CR>

" 每次移动相对屏幕的一行
nnoremap j gj
nnoremap k gk

nnoremap <leader><leader> <ESC>:nohlsearch<CR>

" 终端按键绑定
tnoremap <C-^> <C-\><C-n><C-^> " 切换buffer
map <C-6> <C-^>

nnoremap <leader>ce <ESC>:e $MYVIMRC<CR>
nnoremap <leader>cr <ESC>:source $MYVIMRC<CR>
nnoremap <leader>cl <ESC>:e $MY_VIM_PATH/init_local.vim<CR>
nnoremap <leader>cp <ESC>:e $MY_VIM_PATH/plugin_local.vim<CR>
nnoremap <leader>cs <ESC>:e $MY_VIM_PATH/preset_local.vim<CR>
nnoremap <leader>ca <ESC>:e $MY_VIM_PATH/ab.vim<CR>

autocmd! FileType qf nmap <buffer> q <ESC>:cclose<CR>
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> \q <ESC>:call ToggleQuickFix()<CR>
" }}}

" AB: {{{2
if filereadable($MY_VIM_PATH.'/ab.vim')
	source $MY_VIM_PATH/ab.vim
endif

" }}}

" Plugins Config: {{{2

" coc.nvim: {{{3
if exists('g:use_coc')
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? coc#_select_confirm() :
	      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()

	function! s:check_back_space() abort
		  let col = col('.') - 1
		    return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

	let g:coc_snippet_next = '<C-j>'
	let g:coc_snippet_prev = '<C-k>'

	" Use `[d` and `]d` to navigate diagnostics
	nnoremap <silent> [d <Plug>(coc-diagnostic-prev)
	nnoremap <silent> ]d <Plug>(coc-diagnostic-next)

	" Remap keys for gotos
	nnoremap <silent> gd <Plug>(coc-definition)
	nnoremap <silent> gy <Plug>(coc-type-definition)
	nnoremap <silent> gi <Plug>(coc-implementation)
	nnoremap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  else
		call CocAction('doHover')
	  endif
	endfunction

	" Remap for rename current word
	nnoremap <leader>rn <Plug>(coc-rename)

	" format
	xnoremap <leader>f <Plug>(coc-format-selected)
	vnoremap <leader>f <Plug>(coc-format-selected)
	command! -nargs=0 Prettier :CocCommand prettier.formatFile

	nnoremap <leader>o <ESC>:call <SID>Outline()<CR>
	function! s:Outline()
	  if &filetype == 'go'
		exec ':GoDecls'
	  else
		exec ':CocList outline'
	  endif
	endfunction
endif
" }}}

" fzf.vim: {{{3
if exists('g:use_fzf_vim')

nnoremap <leader>f <ESC>:GFiles<CR>
nnoremap <leader>F <ESC>:Files<CR>
nnoremap <leader>b <ESC>:Buffers<CR>
nnoremap <leader>h <ESC>:History<CR>
" Path completion with custom source command
if executable('rg')
	inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
elseif executable('fd')
	inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
endif
" tags
if !exists('g:use_coc')
	nnoremap <leader>o <ESC>:call <SID>Outline()<CR>
	function! s:Outline()
		if &filetype == 'go'
			exec ':GoDecls'
		else
			exec ':Tags'
		endif
	endfunction
endif

endif
" }}}

" vsnip: {{{
let g:vsnip_snippet_dir = $HOME."/.config/nvim/vsnip"
" }}}

" Yggdroot/LeaderF: {{{
if exists('g:use_leaderf')
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF='<leader>ff'
let g:Lf_ShortcutB='<leader>fb'
" nnoremap <leader>ff <Esc>:Leaderf file<CR>
" nnoremap <leader>fb <Esc>:Leaderf buffer<CR>
nnoremap <leader>ff <Esc>:Leaderf file<CR>
nnoremap <leader>hh <Esc>:Leaderf mru<CR>
nnoremap <leader>oo <Esc>:Leaderf bufTag<CR>
endif
" }}}

" nvim-treesitter: {{{
" if exists('g:loaded_nvim_treesitter')
if exists('nvim-0.6')
lua <<EOF
require'nvim-treesitter.configs'.setup {
	highlight = { 
		enable = true,
		disable = {'org'},
		additional_vim_regex_highlighting = {'org'},
	},
	incremental_selection = { 
		enable = true 
	},
	indent = {
		enable = true,
	},
	textobjects = { 
		enable = true 
	},
}
EOF
set foldexpr=nvim_treesitter#foldexpr()
endif
" }}}

" romgrk/nvim-treesitter-context: {{{
if has('nvim-0.6')
lua <<EOF
require'treesitter-context'.setup{
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	throttle = true, -- Throttles plugin updates (may improve performance)
}
EOF
endif
" }}}

" nvim-cmp: {{{3
if exists('g:use_nvim_cmp')
autocmd! FileType go nmap <buffer> <leader>o <ESC>:GoDecls<CR>
autocmd! FileType go nmap <buffer> gd <ESC>:GoDef<CR>
lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- nvim-cmp setup {{{
local cmp = require 'cmp'
cmp.setup {
   snippet = {
     expand = function(args)
	 vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
     end,
   },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<M-p>'] = cmp.mapping.scroll_docs(-4),
    ['<M-n>'] = cmp.mapping.scroll_docs(4),
    ['<M-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
		i = cmp.mapping.close(),
		c = cmp.mapping.close(),
	}),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
	['<Tab>'] = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		else
			fallback()
		end
	end,
	['<S-Tab>'] = function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end,
  },
  sources = {
    { name = 'orgmode' },
    { name = 'nvim_lsp' },
	{ name = 'vsnip' },
	{
		name = 'buffer',
		option = {
			get_bufnrs = function()
				return vim.api.nvim_list_bufs()
			end
		}
	},
  },
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
		}
	})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
	{ name = 'path' }
	}, {
	{ name = 'cmdline' }
	})
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')
local servers = { 'clangd', 'gopls', 'dartls', 'sqls', 'intelephense', 'pylsp', 'sumneko_lua', 'vimls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
	on_attach = on_attach,
    capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	}
  }
end

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path
local sumneko_binary

local isset_sumneko_root_path = vim.fn.exists('g:sumneko_root_path')
local isset_sumneko_binary = vim.fn.exists('g:sumneko_binary')

if isset_sumneko_root_path == 1 then
	sumneko_root_path = vim.api.nvim_get_var('sumneko_root_path')
else
	sumneko_root_path = vim.fn.stdpath('data')..'/lsp_servers/sumneko_lua/extension/server'
end

if isset_sumneko_binary == 1 then
	sumneko_binary = vim.api.nvim_get_var('sumneko_binary')
else
	sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp['sumneko_lua'].setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

nvim_lsp['dartls'].setup {
  cmd = {"dart", vim.api.nvim_get_var('dartls_path'), "--lsp"}
}

-- }}}
EOF

endif
"" }}}

" vim-go: {{{3
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 0
let g:go_updatetime = 500
let g:go_diagnostics_level = 2
let g:go_list_autoclose = 1
let g:go_term_enabled = 1
let g:go_def_mapping_enabled = 0
let g:go_gocode_propose_builtins = 0
let g:go_gocode_propose_source = 0
let g:go_gocode_socket_type = 'unix'
let g:go_doc_balloon = 1
let g:go_doc_popup_window = 0
let g:go_echo_go_info = 1
let g:go_echo_command_info = 0
let g:go_fmt_fail_silently = 0
let g:go_gocode_unimported_packages = 0
" }}}

" gruvbox: {{{3
let g:gruvbox_contrast_dark = 'soft'
" }}}

" session: {{{3
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_directory = '~/.local/share/nvim/sessions'
nnoremap <leader>so <ESC>:OpenSession<CR>
" }}}

" ale: {{{3
let g:ale_open_list=0
let g:ale_set_quickfix=0
let g:ale_list_window_size=1

let g:ale_linters = {
		\ 'bash': ['shellcheck']
	  \ }

" nnoremap <silent> <C-h> <ESC>:ALEPrevious<CR>
" nnoremap <silent> <C-l> <ESC>:ALENext<CR>
" }}}

" lambdalisue/fern.vim: {{{3
if exists('g:use_fern')

nmap \\ <ESC>:Fern . -drawer -toggle<CR>

function! s:init_fern() abort
  nmap <silent> <buffer> <2-LeftMouse> <Plug>(fern-action-open-or-expand)
  nmap <silent> <buffer> <RightMouse> <Plug>(fern-action-collapse)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

let g:fern#default_exclude = '^node_modules$'

" lambdalisue/fern-renderer-nerdfont.vim: {{{4
let g:fern#renderer = "nerdfont"
" }}}

" lambdalisue/glyph-palette.vim: {{{4
augroup my-glyph-palette
	autocmd! *
	autocmd FileType fern call glyph_palette#apply()
	autocmd FileType startify call glyph_palette#apply()
augroup END
" }}}

" yuki-yano/fern-preview.vim: {{{4
function! s:fern_settings() abort
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

" }}}

" fern-bookmark.vim: {{{4
let g:fern#mapping#bookmark#disable_default_mappings = 0
" }}}

endif
" }}}

" antoinemadec/FixCursorHold.nvim: {{{3
let g:cursorhold_updatetime = 100
" }}}

" vim-easy-align: {{{3
xmap <leader>a <Plug>(EasyAlign)
" }}}

" ctrlsf: {{{3
nnoremap <leader>sf <ESC>:CtrlSF<space>
nnoremap <leader>st <ESC>:CtrlSFToggle<CR>
" }}}

" vim-easymotion: {{{3
let g:EasyMotion_do_mapping=0
nmap t <Plug>(easymotion-f)
nmap T <Plug>(easymotion-F)
" }}}

" tagbar: {{{3
nnoremap <leader>tb <ESC>:TagbarToggle<CR>
" }}}

" vim-interestingwords: {{{3
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222', '33', '66', '99', '170']
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#ff6600', '#333399','#ee9933','#aa6622','#ffffff']
" }}}

" expand-region: {{{3
let g:expand_region_text_objects = {
			\ 'iw': 0,
			\ "i'": 0,
			\ "a'": 0,
			\ "i`": 0,
			\ "a`": 0,
			\ 'i"': 0,
			\ 'a"': 0,
			\ "i[": 1,
			\ "a[": 1,
			\ "i<": 1,
			\ "a<": 1,
			\ "it": 1,
			\ "at": 1,
			\ 'i(': 1,
			\ 'a(': 1,
			\ "il": 0,
			\ "i}": 1,
			\ "a}": 1,
	\ }
call expand_region#custom_text_objects('go', {
			\ 'i,': 0,
			\ 'a,': 0,
			\ 'if': 0,
			\ 'af': 0,
			\ 'ic': 0,
			\ 'ac': 0,
      \ })
nmap + <Plug>(expand_region_expand)
vmap + <Plug>(expand_region_expand)
nmap _ <Plug>(expand_region_shrink)
vmap _ <Plug>(expand_region_shrink)
" }}}

" vim-speeddating: {{{3
nmap <C-a> <Plug>SpeedDatingUp
nmap <C-x> <Plug>SpeedDatingDown
" }}}

" urlview.vim: {{{3
nnoremap <silent> <leader>u :Urlview<CR>
" }}}

" surround: {{{3
nmap ds <Plug>Dsurround
nmap cs <Plug>Csurround
nmap yss <Plug>Yssurround
nmap ys <Plug>Ysurround
xmap S <Plug>VSurround
" }}}

" lightline.vim: {{{3
if !exists('g:lightline')
	let g:lightline = {}
endif
if !exists('g:lightline["colorscheme"]')
	let g:lightline['colorscheme'] = 'one'
endif
let g:lightline['active'] = {
			\ 'left': [ ['mode', 'paste' ],
			\			[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\ }
let g:lightline['component_function'] = {
			\ 'gitbranch': 'FugitiveHead'
			\ }
" }}}

" vim-airline: {{{3
if !exists('g:airline_theme')
	let g:airline_theme='powerlineish'
endif
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_detect_spell=0
let g:airline#extensions#whitespace#enabled = 0

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" extensions: {{{4

" csv
let g:airline#extensions#csv#enabled = 1

" branch
let g:airline#extensions#hunks#enabled = 1

" keymap
let g:airline#extensions#keymap#enabled = 1

let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

" ale
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#open_lnum_symbol = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'

let g:airline#extensions#languageclient#enabled = 1
" }}}

" }}}

" vim-stay: {{{3
set viewoptions=cursor,folds,slash,unix
" }}}

" gutentags: {{{3
let g:gutentags_cache_dir = '~/.cache/tags'
let g:gutentags_project_root = ['.git', '.hg', '.svn', '.bzr', '_darcs', '_darcs', '_FOSSIL_', '.fslckout', 'go.mod']
let g:gutentags_exclude_filetypes = []
" }}}

" MatchTagAlways: {{{3
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'vue' : 1,
      \}
" }}}

" Voom: {{{3
function! s:VoomToggleExt()
	let l:filetypes = ['markdown', 'html', 'python']
	if index(l:filetypes, &filetype)>=0
		exec 'VoomToggle '.&filetype
	else
		exec 'VoomToggle'
	endif
endfunction

nnoremap <leader>v <ESC>:call <SID>VoomToggleExt()<CR>
" }}}


" use_markdown {{{
if exists('g:use_markdown')
" markdown: {{{
let g:markdown_fenced_languages = ['bash=sh', 'c', 'ini=dosini', 'go', 'mysql', 'php', 'py=python', 'python', 'sh', 'sql', 'vim'] " 需要在markdown文件中高亮的代码
" }}}

" plasticboy/vim-markdown: {{{
let g:vim_markdown_fenced_languages = g:markdown_fenced_languages
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_conceal = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
" }}}

" SidOfc/mkdx: {{{3
if exists('g:mkdx#settings')
	let g:mkdx#settings = {
		\ 'map': { 'enable': 0 },
		\ 'enter': { 'enable': 0 }
	  \ }
endif

function! s:toggleMarkdownListItemCheckbox()
    let sID = synID(line('.'), col('.'), 1)
	let sName = synIDattr(sID, 'name')
	if sName != 'mkdListItemLine' && sName != 'mkdListItem'
		return
	endif
	if match(getline('.'), '^\s*[\*\-] \[[ -x]\] ') > -1
		call mkdx#ToggleCheckboxState()
	else
		call mkdx#ToggleCheckboxTask()
	endif
endfunction

function! s:markdownSettings()
	nnoremap<silent><buffer> <C-space> :call <SID>toggleMarkdownListItemCheckbox()<CR>
	nnoremap<silent><buffer> <C-t> :call mkdx#ToggleCheckboxTask()<CR>
endfunction

autocmd! BufNew,BufRead *.md call s:markdownSettings()
" }}}

" markdown-preview {{{3
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
" }}}

endif
" }}}

" orgmode: {{{
if has('g:use_org')
lua <<EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require('orgmode').setup({
  -- org_agenda_files = {'~/Dropbox/Notes/*'},
  -- org_default_notes_file = '~/Dropbox/Notes/inbox.org',
  org_todo_keywords = {'TODO', 'DOING', '|', 'DONE'},
  org_blank_before_new_entry = { heading = false, plain_list_item = false },
})
EOF
endif
" }}}

" dhruvasagar/vim-table-mode: {{{
let g:table_mode_align_char = ":"
let g:table_mode_always_active = 0
let g:table_mode_corner = "|"
let g:table_mode_corner_corner = "|"
let g:table_mode_fillchar = '-'
let g:table_mode_header_fillchar = "-"
let g:table_mode_map_prefix = '\t'
let g:table_mode_separator = '|'
let g:table_mode_toggle_map = 'm'
" }}}

" dart: {{{3
let dart_html_in_string=v:true
let g:dart_format_on_save = 1
" }}}

" colorizer: {{{3
let g:colorizer_maxlines=1000
" }}}

" vim-sleuth: {{{3
let g:sleuth_automatic = 1
" }}}

" vim-translate-me: {{{3
let g:vtm_default_mapping = 0
let g:vtm_default_engines = ['youdao', 'ciba']
nmap <silent> <leader>t <Plug>TranslateW
vmap <silent> <leader>t <Plug>TranslateWV
" }}}

" vim-exchange: {{{3
let g:exchange_no_mappings = 1
nmap cxx <Plug>(ExchangeLine)
nmap cxc <Plug>(ExchangeClear)
nmap cx <Plug>(Exchange)
xmap X <Plug>(Exchange)
" }}}

" nuake: {{{3
let g:nuake_size = 0.35
nnoremap <C-Bslash><C-Bslash> :Nuake<CR>
inoremap <C-Bslash><C-Bslash> <C-\><C-n>:Nuake<CR>
tnoremap <C-Bslash><C-Bslash> <C-\><C-n>:Nuake<CR>
" }}}
"
" skywind3000/asyncrun.vim: {{{
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.root.vim', 'go.mod', '.git', '.svn', '.hg']
" }}}

" skywind3000/asynctasks.vim: {{{
function! QfCloseIfEmpty(timer) abort
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        return
    endif
    let is_valid = 0
    for i in getqflist()
        if i.valid == 1
            let is_valid = 1
            break
        endif
    endfor
    if is_valid == 0
        cclose
    endif
endfunction

function! QfAutoClose() abort
    let timer=timer_start(3000, 'QfCloseIfEmpty', {'repeat': 2})
endfunction

function! AsyncTaskDo(t) abort
    call QfAutoClose()
    exec 'AsyncTask ' . a:t
endfunction
let g:asynctasks_config_name = '.tasks.ini'
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 10
nnoremap <silent> <Space>rr <ESC>:silent AsyncTask file-run<CR>
nnoremap <silent> <Space>rp <ESC>:silent AsyncTask project-run<CR>
nnoremap <silent> <Space>bb <ESC>:silent call AsyncTaskDo('file-build')<CR>
nnoremap <silent> <Space>bp <ESC>:silent call AsyncTaskDo('project-build')<CR>
nnoremap <silent> <Space>ss <ESC>:silent call AsyncTaskDo('search')<CR>
" }}}

" liuchengxu/vim-which-key: {{{
nnoremap <silent> <Space> :WhichKey '<Space>'<CR>
" }}}

" APZelos/blamer.nvim: {{{
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 1
let g:blamer_prefix = ' '
let g:blamer_template = '<committer-time> • <summary>, <committer>'
let g:blamer_relative_time = 1
highlight Blamer guifg=orange
" }}}

" }}}

"load local config
if filereadable($MY_VIM_PATH.'/init_local.vim')
	source $MY_VIM_PATH/init_local.vim
endif

" }}}

" vim: foldmethod=marker tabstop=4 shiftwidth=4
