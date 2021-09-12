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

" Plugins: {{{1
call plug#begin('~/.local/share/nvim/plugged')

" Misc: {{{2
if !has('nvim')
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
if has('unix')
	if !has('mac')
		Plug 'lilydjwg/fcitx.vim' " 自动切换中英文
	endif
	Plug 'tpope/vim-eunuch' " Helpers for UNIX
endif
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Valloric/MatchTagAlways', { 'for': ['html','xhtml', 'xml', 'vue'] } " tag配对显示
Plug 'RRethy/vim-illuminate' " Vim plugin for automatically highlighting other uses of the word under the cursor
Plug 'Yggdroot/indentLine', { 'for': ['c', 'cpp', 'python', 'php', 'javascript', 'typescript', 'html', 'xml', 'vue', 'vim'] } " Show vertical lines for indent with conceal feature
Plug 'dhruvasagar/vim-zoom', { 'on': '<Plug>(zoom-toggle)' } " Toggle zoom in / out individual windows (splits) maps: <C-w>m
Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' } " 文件内容查找
Plug 'brooth/far.vim', { 'on': 'Far' } " Find And Replace Vim plugin
Plug 'inkarkat/vim-ingo-library' " Vimscript library of common functions
Plug 'lfv89/vim-interestingwords' " A vim plugin for highlighting and navigating through different words in a buffer.
Plug 'jiazhoulvke/vim-sleuth' " Heuristically set buffer options
Plug 'jiazhoulvke/vim-plug-helper.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 基于文件名快速搜索文件
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-after-object' " Defines text objects to target text after the designated characters.
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " 代码对齐
Plug 'kana/vim-textobj-function', { 'for': ['c', 'cpp', 'vim', 'java'] }
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-user' | Plug 'sgur/vim-textobj-parameter'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } " The ultimate undo history visualizer for VIM
Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.
Plug 'preservim/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'sk1418/Join', { 'on': 'Join' } " 比vim自带的join更强大
Plug 'terryma/vim-expand-region', { 'on': ['<Plug>(expand_region_expand)', '<Plug>(expand_region_shrink)'] } " 逐步扩大选择区域
Plug 'tommcdo/vim-exchange', { 'on': ['<Plug>(ExchangeLine)', '<Plug>(Exchange)'] } " 用cxiw交换单词、cxi'交换‘中的文字等
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim', { 'on': 'GV' } " 对git的封装
Plug 'christoomey/vim-conflicted', { 'on': 'Conflicted' } " Easy git merge conflict resolution in Vim
Plug 'tpope/vim-repeat' " 重复执行操作
Plug 'tpope/vim-rsi' " Readline style insertion
Plug 'tpope/vim-speeddating', { 'on': ['<Plug>SpeedDatingUp', '<Plug>SpeedDatingDown'] } " use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround', { 'on': ['<Plug>Dsurround', '<Plug>Csurround', '<Plug>Yssurround', '<Plug>Ysurround', '<Plug>VSurround'] } " 对括号双引号等进行快速编辑
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'vim-scripts/LargeFile' " 针对大文件优化性能
Plug 'vim-scripts/VisIncr', { 'on': ['I', 'IA'] } " 列编辑
Plug 'vim-voom/VOoM', { 'on': ['Voom', 'VoomToggle'] } " 文档大纲
Plug 'voldikss/vim-translate-me', { 'on': ['Translate', 'TranslateW', 'TranslateWV', '<Plug>TranslateW', '<Plug>TranslateWV'] } " (Neo)Vim translation plugin
Plug 'w0rp/ale', { 'for': ['bash', 'sh'] } " 异步代码检测
Plug 'wellle/targets.vim' " Vim plugin that provides additional text objects: ({[<t(tags)
Plug 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-session', { 'on': ['OpenSession', 'SaveSession'] } " Extended session management for Vim (:mksession on steroids)
Plug 'yianwillis/vimcdoc' " 中文帮助文档
Plug 'zhimsel/vim-stay' " 保持最后的编辑状态
Plug 'Lenovsky/nuake' " A Quake-style terminal panel for Neovim and Vim
Plug 'wellle/context.vim' " shows the context of the currently visible buffer contents
Plug 'qpkorr/vim-renamer' " 以编辑文本的方式批量修改文件名
" }}}

" UI: {{{2
if exists('g:use_lightline')
	Plug 'itchyny/lightline.vim'
else
	Plug 'bling/vim-airline' " beautiful status line
	Plug 'vim-airline/vim-airline-themes'
endif

"themes
Plug 'iCyMind/NeoSolarized' " colorscheme
Plug 'morhetz/gruvbox' " colorscheme
Plug 'rakr/vim-one'

Plug 'ryanoasis/vim-devicons' " Adds file type glyphs/icons to popular Vim plugins
Plug 'luochen1990/rainbow', { 'for':  ['python', 'javascript', 'jsx', 'html', 'css', 'go', 'vim', 'toml', 'lisp', 'scheme'], 'on': 'RainbowToggle' } " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
" }}}

" Languages: {{{2
" markdown-plugins: {{{3
if exists('g:use_markdown')
Plug 'SidOfc/mkdx', { 'for': 'markdown' } " A vim plugin that adds some nice extra's for working with markdown documents
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & npm install'} " markdown preview plugin for (neo)vim
Plug 'mzlogin/vim-kramdown-tab', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
endif
" }}}
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'ap/vim-css-color', { 'for': ['html', 'php', 'vue'] } " css颜色高亮
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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " 更好的高亮
endif
if exists('g:use_vimwiki')
Plug 'vimwiki/vimwiki', { 'for': 'vimwiki' , 'on': ['<Plug>VimwikiIndex', '<Plug>VimwikiUISelect', '<Plug>VimwikiTabIndex', '<Plug>VimwikiDiaryIndex', '<Plug>VimwikiMakeDiaryNote', '<Plug>VimwikiTabMakeDiaryNote', '<Plug>VimwikiMakeTomorrowDiaryNote' ] } " Personal Wiki for Vim
endif
" }}}

" Completion: {{{2
if exists('g:use_coc')
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
endif
if exists('g:use_nvim_cmp')
	Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
	Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
	Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
	Plug 'L3MON4D3/LuaSnip' " Snippets plugin
	Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
endif
" Plug 'Shougo/echodoc.vim' " 不用preview窗口也能显示函数参数
Plug 'fatih/vim-go', { 'for': 'go' } " golang补全
Plug 'honza/vim-snippets' " 代码片段


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
set nocursorline " 不高亮当前行
set conceallevel=2
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
" set completeopt-=preview " 去掉补全时烦人的预览窗口
" set completeopt+=noselect,noinsert
set smartindent " 智能缩进
set autoindent
set ignorecase " 忽略大小写
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

let g:mapleader=','

" 翻页
nmap <M-j> <C-f>zz
nmap <M-k> <C-b>zz
nmap <M-f> <PageDown>
nmap <M-v> <PageUp>
imap <M-f> <PageDown>
imap <M-v> <PageUp>

" 在改变列表中移动
nmap <silent> g; g;zz
nmap <silent> g, g,zz

" 切换窗口
nmap <silent> <space>j <C-w>j
nmap <silent> <space>k <C-w>k
nmap <silent> <space>h <C-w>h
nmap <silent> <space>l <C-w>l

" 关闭窗口
map <M-c> <ESC>:close<CR>


" 切换tab
nmap <M-1> 1gt
nmap <M-2> 2gt
nmap <M-3> 3gt
nmap <M-4> 4gt
nmap <M-5> 5gt
nmap <M-6> 6gt
nmap <M-7> 7gt
nmap <M-8> 8gt
nmap <M-9> 9gt

" 保存
map <C-s> <ESC>:update<CR>
imap <C-s> <ESC>:update<CR>
nnoremap <leader>s <ESC>:update<CR>

" CTRL-X剪切
vmap <C-X> "+x

" Ctrl+C复制
vmap <C-C> "+y

" CTRL-V粘贴
vmap <C-V> "+gp
cmap <C-V> <S-Insert>
nnoremap <C-v> <ESC>i<C-r>+<ESC>
imap <C-v> <C-r>+

" 列选择模式
nmap vv <C-Q>

" 普通模式下复制文件路径
map <Leader>cp :let @+=expand('%:p')<CR>

" 插入模式下上开一行
imap <C-CR> <ESC>O

" 删除后面的字符
imap <C-d> <DEL>

" 删除一个词
imap <M-BS> <C-w>

" 用Tab缩进
nmap <Tab> v>
nmap <S-Tab> v<
vmap <Tab> >
vmap <S-Tab> <

" Ctrl+方向键调整窗口大小
nmap <C-Up> <C-w>+
nmap <C-Down> <C-w>-
nmap <C-Left> <C-w><
nmap <C-Right> <C-w>>

" 用'切换折叠状态
nmap ' za

" 进入当前buffer所在目录
nmap <leader>cd <ESC>:cd %:p:h<CR>

" 删除^M
"nmap <Leader>dm mmHmn:%s/<C-V><cr>//ge<cr>'nzt'm
nmap <Leader>dm <ESC>:%s/\r$//<CR>

" 删除空行
nmap <Leader>dbl :g/^\s*$/d<CR>

" json格式化
nmap <leader>jq <ESC>:%!jq '.'<CR>

" 每次移动相对屏幕的一行
nmap j gj
nmap k gk

nmap <space><space> <ESC>:nohlsearch<CR>

" 终端按键绑定
" nmap <C-t> <ESC>:terminal<CR> " 进入终端
tmap <C-o> <C-\><C-n> " 进入默认模式
tmap <C-^> <C-\><C-n><C-^> " 切换buffer
tmap <A-h> <C-\><C-N><C-w>h
tmap <A-j> <C-\><C-N><C-w>j
tmap <A-k> <C-\><C-N><C-w>k
tmap <A-l> <C-\><C-N><C-w>l

nmap <leader>ee <ESC>:e $MYVIMRC<CR>
nmap <leader>rr <ESC>:source $MYVIMRC<CR>
nmap <leader>el <ESC>:e $MY_VIM_PATH/init_local.vim<CR>
nmap <leader>ep <ESC>:e $MY_VIM_PATH/plugin_local.vim<CR>
nmap <leader>es <ESC>:e $MY_VIM_PATH/preset_local.vim<CR>
nmap <leader>ea <ESC>:e $MY_VIM_PATH/ab.vim<CR>

map <C-6> <C-^>

function! EditSnip()
	let ftype = &filetype
	if ftype == ''
		let ftype = 'all'
	endif
	let snip_dir = $MY_VIM_PATH.'/UltiSnips/'
	if !isdirectory(snip_dir)
		call mkdir(snip_dir)
	endif
	let snip_file = snip_dir . ftype .'.snippets'
	exec 'edit ' snip_file
endfunction
command! EditSnip call EditSnip()

nmap <leader>en <ESC>:EditSnip<CR>

" }}}

" AB: {{{2
if filereadable($MY_VIM_PATH.'/ab.vim')
	source $MY_VIM_PATH/ab.vim
endif

" }}}

" Plugins Config: {{{2

" coc.nvim: {{{3
if exists('g:use_coc')
	call coc#add_extension('coc-marketplace','coc-css','coc-emmet','coc-html','coc-json','coc-lists','coc-snippets','coc-yaml','coc-vimlsp','coc-calc')
	" inoremap <silent><expr> <M-.> coc#refresh()

	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? coc#_select_confirm() :
	      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()

	function! s:check_back_space() abort
		  let col = col('.') - 1
		    return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

	let g:coc_snippet_next = '<c-j>'
	let g:coc_snippet_prev = '<c-k>'

	" Use `[d` and `]d` to navigate diagnostics
	nmap <silent> [d <Plug>(coc-diagnostic-prev)
	nmap <silent> ]d <Plug>(coc-diagnostic-next)

	" Remap keys for gotos
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

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
	nmap <leader>rn <Plug>(coc-rename)

	" format
	xmap <leader>f <Plug>(coc-format-selected)
	vmap <leader>f <Plug>(coc-format-selected)
	command! -nargs=0 Prettier :CocCommand prettier.formatFile

	nmap <leader>f <ESC>:CocList files<CR>
	nmap <leader>b <ESC>:CocList buffers<CR>
	nmap <leader>h <ESC>:CocList mru<CR>
	" nmap <leader>t <ESC>:CocList tags<CR>
	nmap <leader>o <ESC>:call <SID>Outline()<CR>
	function! s:Outline()
	  if &filetype == 'go'
		exec ':GoDecls'
	  else
		exec ':CocList outline'
	  endif
	endfunction
endif
" }}}

if !exists('g:use_coc')
" fzf.vim: {{{3
	noremap <leader>f <ESC>:GFiles<CR>
	noremap <leader>F <ESC>:Files<CR>
	noremap <leader>b <ESC>:Buffers<CR>
	noremap <leader>o <ESC>:call <SID>Outline()<CR>
	function! s:Outline()
		if &filetype == 'go'
			exec ':GoDecls'
		else
			exec ':Tags'
		endif
	endfunction
" }}}
endif

if exists('g:use_asyncomplete_vim')
" asyncomplete.vim: {{{3
	let g:asyncomplete_matchfuzzy=1

	" golang
	if executable('gopls')
		au User lsp_setup call lsp#register_server({
			\ 'name': 'gopls',
			\ 'cmd': {server_info->['gopls']},
			\ 'allowlist': ['go'],
			\ })
	endif

	" dart
	if executable('dart_analysis_server')
		" dart_analysis_server是一个简单的脚本，内容大致如下:
		" #!/usr/bin/env
		" dart $DART_SDK_PATH/bin/snapshots/analysis_server.dart.snapshot --lsp
		au User lsp_setup call lsp#register_server({
			\ 'name': 'dart',
			\ 'cmd': {server_info->['dart_analysis_server']},
			\ 'allowlist': ['dart'],
			\ })
	endif

	function! s:Definition()
		if &filetype == 'go'
			exec ':GoDef'
		else
			exec ':LspDefinition'
		endif
	endfunction

	function! s:References()
		if &filetype == 'go'
			exec ':GoCallers'
		else
			exec ':GoReferrers'
		endif
	endfunction

	function! s:on_lsp_buffer_enabled() abort
		setlocal omnifunc=lsp#complete
		" setlocal signcolumn=yes
		if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
		" nmap <buffer> gd <plug>(lsp-definition)
		nmap <buffer> gd <ESC>:call <SID>Definition()<CR>
		nmap <buffer> gr <plug>(lsp-references)
		nmap <buffer> gi <plug>(lsp-implementation)
		nmap <buffer> gt <plug>(lsp-type-definition)
		nmap <buffer> <leader>rn <plug>(lsp-rename)
		nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
		nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
		nmap <buffer> K <plug>(lsp-hover)

		" refer to doc to add more commands
	endfunction

	augroup lsp_install
		au!
		" call s:on_lsp_buffer_enabled only for languages that has the server registered.
		autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
	augroup END

	let g:asyncomplete_auto_popup = 1
	inoremap	<expr><Tab>		pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap	<expr><S-tab>	pumvisible() ? "\<C-p>" : "\<S-Tab>"
	inoremap	<expr><cr>		pumvisible() ? "\<C-y>" : "\<cr>"
	imap		<M-.>		<Plug>(asyncomplete_force_refresh)
" }}}

" asyncomplete-buffer.vim: {{{3
	call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
		\ 'name': 'buffer',
		\ 'allowlist': ['*'],
		\ 'blocklist': ['lisp'],
		\ 'completor': function('asyncomplete#sources#buffer#completor'),
		\ 'config': {
		\    'max_buffer_size': 5000000,
		\  },
		\ }))
" }}}

" asyncomplete-file.vim: {{{3
	au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
		\ 'name': 'file',
		\ 'allowlist': ['*'],
		\ 'priority': 10,
		\ 'completor': function('asyncomplete#sources#file#completor')
		\ }))
" }}}

" tmux-complete.vim: {{{3
	let g:tmuxcomplete#asyncomplete_source_options = {
				\ 'name':      'tmuxcomplete',
				\ 'whitelist': ['*'],
				\ 'config': {
				\     'splitmode':      'words',
				\     'filter_prefix':   1,
				\     'show_incomplete': 1,
				\     'sort_candidates': 0,
				\     'scrollback':      0,
				\     'truncate':        0
				\     }
				\ }
" }}}

" asyncomplete-necovim.vim: {{{3
	au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
		\ 'name': 'necovim',
		\ 'allowlist': ['vim'],
		\ 'completor': function('asyncomplete#sources#necovim#completor'),
		\ }))
	" }}}
endif

" nvim-cmp: {{{3
if exists('g:use_nvim_cmp')
lua << EOF
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup {{{
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

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
	-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	-- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	-- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local nvim_lsp = require('lspconfig')
local servers = { 'clangd', 'gopls', 'dartls', 'sqls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
	on_attach = on_attach,
    capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	}
  }
end

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

" echodoc: {{{3
" let g:echodoc#enable_at_startup = 0
" let g:echodoc#type = 'echo'
" }}}

" session: {{{3
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_directory = '~/.local/share/nvim/sessions'
nmap <space>s <ESC>:OpenSession<CR>
" }}}

" ale: {{{3
let g:ale_open_list=0
let g:ale_set_quickfix=0
let g:ale_list_window_size=1

let g:ale_linters = {
		\ 'bash': ['shellcheck']
	  \ }

nmap <silent> <C-h> <Plug>(ale_previous)
nmap <silent> <C-l> <Plug>(ale_next)
" }}}

" nerdtree: {{{3
nmap - <ESC>:NERDTreeToggle<CR>
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'php', 'go', 'html', 'js', 'css']
" }}}

" vim-easy-align: {{{3
xmap <space>a <Plug>(EasyAlign)
nmap <space>a <Plug>(EasyAlign)
" }}}

" vim-mark: {{{
let g:mw_no_mappings = 1
nmap <leader>m <Plug>MarkSet
xmap <leader>m <Plug>MarkSet
" }}}

" ctrlsf: {{{3
nmap <space>sf <ESC>:CtrlSF<space>
nmap <space>ss <ESC>:CtrlSFToggle<CR>
" }}}

" vim-easymotion: {{{3
nmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)
" }}}

" zoom: {{{3
nmap <C-w>m <Plug>(zoom-toggle)
" }}}

" tagbar: {{{3
noremap <space>t <ESC>:TagbarToggle<CR>
" }}}

" vim-interestingwords: {{{3
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222', '33', '66', '99', '170']
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#ff6600', '#333399','#ee9933','#aa6622','#ffffff']
" }}}

" expand-region: {{{3
nmap + <Plug>(expand_region_expand)
vmap + <Plug>(expand_region_expand)
nmap _ <Plug>(expand_region_shrink)
vmap _ <Plug>(expand_region_shrink)
" }}}

" vim-speeddating: {{{3
nmap <C-a> <Plug>SpeedDatingUp
nmap <C-x> <Plug>SpeedDatingDown
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

" vim-devicons: {{{3
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" }}}

" vim-stay: {{{3
set viewoptions=cursor,folds,slash,unix
" }}}

" gutentags: {{{3
let g:gutentags_cache_dir = '~/.tags'
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
	let l:filetypes = ['markdown', 'vimwiki', 'html', 'python']
	if index(l:filetypes, &filetype)>=0
		exec 'VoomToggle '.&filetype
	else
		exec 'VoomToggle'
	endif
endfunction

nmap <leader>v <ESC>:call <SID>VoomToggleExt()<CR>
" }}}

" markdown: {{{3
let g:markdown_fenced_languages = ['bash=sh', 'c', 'ini=dosini', 'go', 'mysql', 'php', 'py=python', 'python', 'sh', 'sql', 'vim'] " 需要在markdown文件中高亮的代码
" }}}

" plasticboy/vim-markdown: {{{3
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

" dhruvasagar/vim-table-mode: {{{3
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
	nmap<silent><buffer> <C-space> :call <SID>toggleMarkdownListItemCheckbox()<CR>
	nmap<silent><buffer> <C-t> :call mkdx#ToggleCheckboxTask()<CR>
endfunction

autocmd! BufNew,BufRead *.md call s:markdownSettings()
" }}}

" markdown-preview {{{3
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
" }}}

" vimwiki: {{{3
if exists('g:use_vimwiki')
" 通过使用:profile进行分析，发现添加太多语言的高亮会严重拖慢
" 打开wiki文件的速度，所以只定义一些自己经常会用的语言比较好
let nested_syntaxes = {
	  \ 'c':          'c',
	  \ 'go':         'go',
	  \ 'ini':        'dosini',
	  \ 'js':         'javascript',
	  \ 'lua':        'lua',
	  \ 'mysql':      'mysql',
	  \ 'php':        'php',
	  \ 'python':     'python',
	  \ 'sh':         'sh',
	  \ 'vim':        'vim',
	\ }
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script'
if has('unix')
	let g:vimwiki_list = [ { 'path': '~/Dropbox/VimWiki/', 'path_html': '~/Dropbox/VimWiki_html/', 'template_path': '~/Dropbox/VimWiki/templates', 'template_default': 'default', 'template_ext': '.html', 'auto_toc': 1, 'nested_syntaxes' : nested_syntaxes }, { 'path': '~/Documents/VimWiki/', 'path_html': '~/Documents/VimWiki_html/', 'template_path': '~/Dropbox/VimWiki/templates', 'template_default': 'default', 'template_ext': '.html', 'auto_toc': 1, 'nested_syntaxes': nested_syntaxes } ]
else
	let drive_list = ['D', 'E', 'F', 'G']
	for drive in drive_list
		let dropbox_path = drive . ':\Dropbox'
		if isdirectory(dropbox_path)
			let g:vimwiki_list = [ { 'path': dropbox_path.'\VimWiki\', 'path_html': dropbox_path.'\VimWiki_html\', 'template_path': dropbox_path.'\VimWiki\templates', 'template_default': 'default', 'template_ext': '.html', 'auto_toc': 1, 'nested_syntaxes': nested_syntaxes }, { 'path': '~/Documents/VimWiki/', 'path_html': '~/Documents/VimWiki_html/', 'auto_toc': 1, 'nested_syntaxes': nested_syntaxes } ]
			break
		endif
	endfor
endif
nmap <Leader>ww <Plug>VimwikiIndex
nmap <Leader>ws <Plug>VimwikiUISelect
nmap <Leader>wt <Plug>VimwikiTabIndex
nmap <Leader>wi <Plug>VimwikiDiaryIndex
nmap <Leader>w<Leader>w <Plug>VimwikiMakeDiaryNote
nmap <Leader>w<Leader>t <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>w<Leader>m <Plug>VimwikiMakeTomorrowDiaryNote
nmap <Leader><Leader> <Plug>VimwikiFollowLink
nmap <Leader>wn <Plug>VimwikiNextLink
nmap <Leader>wp <Plug>VimwikiPrevLink
endif
" }}}

" dart: {{{3
let dart_html_in_string=v:true
let g:dart_format_on_save = 1
" }}}

" indentLine: {{{3
let g:indentLine_char = '┊'
let g:indentLine_fileType = ['c', 'cpp', 'python', 'php', 'javascript', 'typescript', 'html', 'xml', 'vue']
let g:indentLine_fileTypeExclude = ['text']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
" }}}

" vim-sleuth: {{{3
let g:sleuth_automatic = 1
" }}}

" vim-translate-me: {{{3
let g:vtm_default_mapping = 0
let g:vtm_default_engines = ['youdao', 'ciba', 'google']
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
nnoremap <C-Bslash> :Nuake<CR>
inoremap <C-Bslash> <C-\><C-n>:Nuake<CR>
tnoremap <C-Bslash> <C-\><C-n>:Nuake<CR>
" }}}

" }}}

" context.vim: {{{3
let g:context_nvim_no_redraw = 1
" let g:context_add_autocmds = 0
" autocmd VimEnter     * ContextActivate
" autocmd BufAdd       * call context#update('BufAdd')
" autocmd BufEnter     * call context#update('BufEnter')
" autocmd CursorMoved  * call context#update('CursorMoved')
" autocmd VimResized   * call context#update('VimResized')
" autocmd CursorHold   * call context#update('CursorHold')
" autocmd User GitGutter call context#update('GitGutter')
" autocmd OptionSet number,relativenumber,numberwidth,signcolumn,tabstop,list
"             \          call context#update('OptionSet')
" }}}

"load local config
if filereadable($MY_VIM_PATH.'/init_local.vim')
	source $MY_VIM_PATH/init_local.vim
endif

" }}}

" vim: foldmethod=marker tabstop=4 shiftwidth=4
