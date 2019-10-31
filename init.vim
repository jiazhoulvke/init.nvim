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
if exists('g:use_defx')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
endif
if exists('g:use_nerdtree')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
endif
Plug 'liuchengxu/vista.vim' "Viewer & Finder for LSP symbols and tags
Plug 'liuchengxu/vim-clap'
Plug 'Valloric/MatchTagAlways', { 'for': ['html','xhtml', 'xml', 'vue'] } " tag配对显示
Plug 'Yggdroot/indentLine', { 'for': ['c', 'cpp', 'python', 'php', 'javascript', 'typescript', 'html', 'xml', 'vue', 'vim'] } " Show vertical lines for indent with conceal feature
Plug 'dhruvasagar/vim-zoom', { 'on': '<Plug>(zoom-toggle)' } " Toggle zoom in / out individual windows (splits) maps: <C-w>m
Plug 'dyng/ctrlsf.vim', { 'on': 'CtrlSF' } " 文件内容查找
Plug 'haya14busa/incsearch.vim',{ 'on': ['<Plug>(incsearch-forward)', '<Plug>(incsearch-backward)'] } " 对vim自带搜索的强化，可以同时搜索多个词
Plug 'inkarkat/vim-ingo-library' " Vimscript library of common functions
Plug 'inkarkat/vim-mark', { 'on': [ '<Plug>MarkToggle', '<Plug>MarkSet', 'Mark' ] } " Highlight several words in different colors simultaneously.
Plug 'jiazhoulvke/vim-sleuth' " Heuristically set buffer options
Plug 'jiazhoulvke/vim-plug-helper.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 基于文件名快速搜索文件
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': ['markdown', 'vimwiki', 'text'] }
Plug 'junegunn/limelight.vim', { 'for': ['markdown', 'vimwiki', 'text'] }
Plug 'junegunn/vim-after-object' " Defines text objects to target text after the designated characters.
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " 代码对齐
Plug 'kana/vim-textobj-function', { 'for': ['c', 'cpp', 'vim', 'java'] }
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-user' | Plug 'sgur/vim-textobj-parameter'
Plug 'ludovicchabant/vim-gutentags' " A Vim plugin that manages your tag files
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } " The ultimate undo history visualizer for VIM
Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.
Plug 'rhysd/clever-f.vim', { 'on': [ '<Plug>(clever-f-f)', '<Plug>(clever-f-F)', '<Plug>(clever-f-t)', '<Plug>(clever-f-T)'] } " Extended f, F, t and T key mappings for Vim
Plug 'sk1418/Join', { 'on': 'Join' } " 比vim自带的join更强大
Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' } " 异步执行命令
Plug 'terryma/vim-expand-region', { 'on': ['<Plug>(expand_region_expand)', '<Plug>(expand_region_shrink)'] } " 逐步扩大选择区域
Plug 'tommcdo/vim-exchange', { 'on': ['<Plug>(ExchangeLine)', '<Plug>(Exchange)'] } " 用cxiw交换单词、cxi'交换‘中的文字等
Plug 'tomtom/tcomment_vim', { 'on': '<Plug>TComment_gcc' }  " An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim', { 'on': 'GV' } " 对git的封装
Plug 'tpope/vim-repeat' " 重复执行操作
Plug 'tpope/vim-rsi' " Readline style insertion
Plug 'tpope/vim-speeddating', { 'on': ['<Plug>SpeedDatingUp', '<Plug>SpeedDatingDown'] } " use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround', { 'on': ['<Plug>Dsurround', '<Plug>Csurround', '<Plug>Yssurround', '<Plug>Ysurround', '<Plug>VSurround'] } " 对括号双引号等进行快速编辑
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
Plug 'vim-scripts/LargeFile' " 针对大文件优化性能
Plug 'vim-scripts/VisIncr', { 'on': ['I', 'IA'] } " 列编辑
Plug 'vim-voom/VOoM', { 'on': ['Voom', 'VoomToggle'] } " 文档大纲
Plug 'voldikss/vim-translate-me', { 'on': ['Translate', 'TranslateW', 'TranslateWV', '<Plug>TranslateW', '<Plug>TranslateWV'] } " (Neo)Vim translation plugin
Plug 'w0rp/ale', { 'for': 'c' } " 异步代码检测
Plug 'wellle/targets.vim' " Vim plugin that provides additional text objects: ({[<t(tags)
Plug 'xolox/vim-misc' " Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-session', { 'on': ['OpenSession', 'SaveSession'] } " Extended session management for Vim (:mksession on steroids) 
Plug 'yianwillis/vimcdoc' " 中文帮助文档
Plug 'zhimsel/vim-stay' " 保持最后的编辑状态
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
Plug 'romainl/flattened' " colorscheme

Plug 'ryanoasis/vim-devicons' " Adds file type glyphs/icons to popular Vim plugins
Plug 'luochen1990/rainbow', { 'for':  ['python', 'javascript', 'jsx', 'html', 'css', 'go', 'vim', 'toml', 'lisp', 'scheme'], 'on': 'RainbowToggle' } " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
Plug 't9md/vim-choosewin', { 'on': 'ChooseWin' } " Land on window you chose like tmux's 'display-pane'
" }}}

" Languages: {{{2
" markdown-plugins: {{{3
Plug 'SidOfc/mkdx', { 'for': 'markdown' } " A vim plugin that adds some nice extra's for working with markdown documents
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & yarn install'} " markdown preview plugin for (neo)vim
Plug 'mzlogin/vim-kramdown-tab', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" }}}
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'ap/vim-css-color', { 'for': ['html', 'php', 'vue'] } " css颜色高亮
Plug 'cespare/vim-toml', { 'for': 'toml' } " toml语法插件
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'groenewege/vim-less', { 'for': 'less' } " less语法插件
Plug 'jansenm/vim-cmake', { 'for': 'cmake' }
Plug 'matze/vim-ini-fold', { 'for': ['dosini', 'ini'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " 更好的缩进
Plug 'tweekmonster/hl-goimport.vim', { 'for': 'go' } " 高亮golang包名
Plug 'vimwiki/vimwiki', { 'for': 'vimwiki' , 'on': ['<Plug>VimwikiIndex', '<Plug>VimwikiUISelect', '<Plug>VimwikiTabIndex', '<Plug>VimwikiDiaryIndex', '<Plug>VimwikiMakeDiaryNote', '<Plug>VimwikiTabMakeDiaryNote', '<Plug>VimwikiMakeTomorrowDiaryNote' ] } " Personal Wiki for Vim
" }}}

" Completion: {{{2
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Shougo/echodoc.vim' " 不用preview窗口也能显示函数参数
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
set background=dark
set shortmess+=c " 关掉一些烦人的信息
"set cmdheight=2 " 命令行高度设为2，echodoc需要
set noshowmode " 不显示当前状态
set display=lastline " 解决超长行显示异常的问题
set lazyredraw " 不立即重绘
set nocursorline " 不高亮当前行
set conceallevel=2
if exists('g:use_truecolor')
	set termguicolors " 设置真彩色
endif
colorscheme gruvbox
if has("gui_running")
	set guioptions-=m
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
endif
" }}}

" Misc: {{{2
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
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
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
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

" CTRL-X剪切
vmap <C-X> "+x

" Ctrl+C复制
vmap <C-C> "+y

" CTRL-V粘贴
nmap <C-V> "+gp
vmap <C-V> "+gp
imap <C-V> <C-O>"+gp
cmap <C-V> <S-Insert>

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

" }}}

" AB: {{{2
if filereadable($MY_VIM_PATH.'/ab.vim')
	source $MY_VIM_PATH/ab.vim
endif

" }}}

" Plugins Config: {{{2

" coc.nvim: {{{3
call coc#add_extension('coc-marketplace','coc-css','coc-emmet','coc-html','coc-json','coc-lists','coc-snippets','coc-yaml','coc-phpls','coc-vimlsp','coc-calc','coc-tsserver','coc-vetur')
inoremap <silent><expr> <M-.> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? '\<C-y>' : '\<C-g>u\<CR>'
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" }}}

" vim-go: {{{3
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 0
let g:go_updatetime = 500
let g:go_list_autoclose = 1
let g:go_term_enabled = 1
let g:go_def_mapping_enabled = 0
let g:go_gocode_propose_builtins = 0
let g:go_gocode_propose_source = 0
let g:go_gocode_socket_type = 'unix'
let g:go_echo_go_info = 1
let g:go_echo_command_info = 0
let g:go_fmt_fail_silently = 0
let g:go_gocode_unimported_packages = 0
" }}}

" gruvbox: {{{3
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark = 'soft'
" }}}

" echodoc: {{{3
let g:echodoc#enable_at_startup = 1
if has('nvim-0.3.8')
  let g:echodoc#type = 'floating'
else
  let g:echodoc#type = 'echo'
endif
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

nmap <silent> <C-h> <Plug>(ale_previous)
nmap <silent> <C-l> <Plug>(ale_next)
" }}}

" nerdtree: {{{3
if exists('g:use_nerdtree')
	nmap - <ESC>:NERDTreeToggle<CR>
endif
" }}}

" defx: {{{3
if exists('g:use_defx')

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

call defx#custom#option('_', {
			\ 'winwidth': 35,
			\ 'columns': 'git:mark:indent:icons:filename:type',
			\ 'split': 'vertical',
			\ 'direction': 'topleft',
			\ 'show_ignored_files': 0,
			\ 'buffer_name': '',
			\ 'toggle': 1,
			\ 'resume': 1
			\ })

call defx#custom#column('indent', {
			\ 'indent': '  ',
			\ })

nmap <silent> - :Defx<CR>

autocmd FileType defx call s:defx_settings()
function! s:defx_settings() abort
	setl nospell
	setl signcolumn=no
	setl nonumber
	nmap <silent><buffer><expr> <2-LeftMouse>
				\ defx#is_directory() ?
				\ defx#do_action('open_or_close_tree') :
				\ defx#do_action('drop',)
	nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
	nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
	nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
	nnoremap <silent><buffer><expr> o
				\ defx#is_directory() ?
				\ defx#do_action('open_or_close_tree') :
				\ defx#do_action('drop',)
	nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
	nnoremap <silent><buffer><expr> c defx#do_action('copy')
	nnoremap <silent><buffer><expr> p defx#do_action('paste')
	nnoremap <silent><buffer><expr> m defx#do_action('rename')
	nnoremap <silent><buffer><expr> dd defx#do_action('remove', 1)
	nnoremap <silent><buffer><expr> a defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> <CR> defx#do_action('toggle_select')
	nnoremap <silent><buffer><expr> R defx#do_action('redraw')
	nnoremap <silent><buffer><expr> / defx#do_action('search',)
endfunction
endif
" }}}

" kristijanhusak/defx-git: {{{3
let g:defx_git#indicators = {
			\ 'Modified'  : '✹',
			\ 'Staged'    : '✚',
			\ 'Untracked' : '✭',
			\ 'Renamed'   : '➜',
			\ 'Unmerged'  : '═',
			\ 'Ignored'   : '☒',
			\ 'Deleted'   : '✖',
			\ 'Unknown'   : '?'
			\ }
let g:defx_git#column_length = 0
" }}}

" kristijanhusak/defx-icons: {{{3
let g:defx_icons_enable_syntax_highlight = 1
" }}}

" liuchengxu/vim-clap: {{{3
nmap <leader>f <ESC>:Clap files<CR>
nmap <leader>b <ESC>:Clap buffers<CR>
nmap <leader>h <ESC>:Clap history<CR>
nmap <leader>l <ESC>:Clap lines<CR>
" }}}

" vista: {{{3
let g:vista_echo_cursor_strategy = 'both'
let g:vista_close_on_jump = 1
nmap <space>t <ESC>:Vista!!<CR>
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

" clever-f: {
nmap f <Plug>(clever-f-f)
nmap F <Plug>(clever-f-F)
nmap t <Plug>(clever-f-t)
nmap T <Plug>(clever-f-T)
" }

" zoom: {{{3
nmap <C-w>m <Plug>(zoom-toggle)
" }}}

" expand-region: {{{3
map + <Plug>(expand_region_expand)
map _ <Plug>(expand_region_shrink)
" }}}
"

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

" incsearch.vim: {{{3
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-s;ay)
nmap <space><space> <ESC>:nohlsearch<CR>
" }}}

" vim-airline: {{{3
let g:airline_theme='powerlineish'
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
	let g:vimwiki_list = [ { 'path': '~/Dropbox/VimWiki/', 'path_html': '~/Dropbox/VimWiki_html/', 'template_path': '~/Dropbox/VimWiki/templates', 'template_default': 'default', 'template_ext': '.html', 'auto_toc': 1, 'nested_syntaxes' : nested_syntaxes }, { 'path': '~/Documents/VimWiki/', 'path_html': '~/Documents/VimWiki_html/', 'auto_toc': 1, 'nested_syntaxes': nested_syntaxes } ]
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
" }}}

" limelight: {{{3
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

" tcomment: {{{3
let g:tcomment_maps = 0
nmap <silent> <space>c <Plug>TComment_gcc
xmap <silent> <space>c <Plug>TComment_gcc
nmap <silent> <M-/> <Plug>TComment_gcc
xmap <silent> <M-/> <Plug>TComment_gcc
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

" choosewin: {{{3
nmap <leader>cw <ESC>:ChooseWin<CR>
let g:choosewin_overlay_enable = 1
" }}}

" vim-exchange: {{{3
let g:exchange_no_mappings = 1
nmap cxx <Plug>(ExchangeLine)
nmap cxc <Plug>(ExchangeClear)
nmap cx <Plug>(Exchange)
xmap X <Plug>(Exchange)
" }}}

" }}}

"load local config
if filereadable($MY_VIM_PATH.'/init_local.vim')
	source $MY_VIM_PATH/init_local.vim
endif

" }}}

" vim: foldmethod=marker tabstop=4 shiftwidth=4
