let g:neosolarized_termtrans = 1

" Plugins: {{{1
call plug#begin('~/.local/share/nvim/plugged')

" Misc: {{{2
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 基于文件名快速搜索文件
Plug 'junegunn/fzf.vim'
Plug 'Valloric/MatchTagAlways' " tag配对显示
Plug 'dyng/ctrlsf.vim' " 文件内容查找
Plug 'haya14busa/incsearch.vim' " 对vim自带搜索的强化，可以同时搜索多个词
Plug 'junegunn/vim-easy-align' " 代码对齐
Plug 'justinmk/vim-sneak' " 快速移动,类似vim自带的f，但sneak支持多行
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function' 
Plug 'sgur/vim-textobj-parameter'
" Plug 'majutsushi/tagbar' " 显示tag
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sk1418/Join' " 比vim自带的join更强大
Plug 'skywind3000/asyncrun.vim' " 异步执行命令
Plug 'terryma/vim-expand-region' " 逐步扩大选择区域
Plug 'terryma/vim-multiple-cursors' " 多重选择
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' " 对git的封装
Plug 'tpope/vim-repeat' " 重复执行操作
Plug 'tpope/vim-rsi' " Readline style insertion
Plug 'tpope/vim-surround' " 对括号双引号等进行快速编辑
Plug 'wellle/targets.vim' " 一款牛逼至极的text-objects插件
Plug 'vim-scripts/LargeFile' " 针对大文件优化性能
Plug 'vim-scripts/Mark--Karkat'
Plug 'vim-scripts/VisIncr' " 列编辑
Plug 'w0rp/ale' " 异步代码检测
Plug 'xolox/vim-misc' " 库
Plug 'xolox/vim-session' " 管理session
Plug 'lilydjwg/fcitx.vim' " 自动切换中英文

" }}}

" UI: {{{2
Plug 'mhinz/vim-startify' " The fancy start screen for Vim.
Plug 'iCyMind/NeoSolarized' " 支持真彩色的solarized
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons' " Adds file type glyphs/icons to popular Vim plugins
" }}}

" Languages: {{{2
Plug 'matze/vim-ini-fold'
Plug 'chrisbra/csv.vim'
" Plug 'cespare/vim-toml' " toml语法插件
" Plug 'groenewege/vim-less' " less语法插件
" Plug 'tpope/vim-markdown' " markdown语法插件，支持在markdown中高亮代码块
" Plug 'pangloss/vim-javascript' " 更好的缩进
" Plug 'jansenm/vim-cmake'
" Plug 'xolox/vim-lua-ftplugin'
" }}}

" Completion: {{{2
Plug 'maralla/completor.vim' " 补全框架

Plug 'Shougo/echodoc.vim' " 不用preview窗口也能显示函数参数
Plug 'fatih/vim-go', {'for': 'go'} " golang补全
" Plug 'mattn/emmet-vim', {'for': ['php', 'html', 'css', 'xml']} " html、css代码片段
" Plug 'othree/csscomplete.vim', {'for': 'css'} " css补全
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " 代码片段
Plug 'scrooloose/nerdcommenter' " 注释插件
Plug 'wannesm/wmgraphviz.vim' "graphviz补全

"}}}

if filereadable($HOME.'/.config/nvim/plugin_local.vim')
	source ~/.config/nvim/plugin_local.vim
endif

call plug#end()
" }}}

" Config: {{{1

" UI: {{{2
set number " 启用行号
set tabstop=4 " tab宽度设为4
" set softtabstop=4
set shiftwidth=4 " 换行宽度设为4
colo NeoSolarized
set background=dark
set shortmess+=c " 关掉一些烦人的信息
"set cmdheight=2 " 命令行高度设为2，echodoc需要
set noshowmode " 不显示当前状态
set display=lastline " 解决超长行显示异常的问题
set lazyredraw " 不立即重绘
set cursorline " 高亮当前行
if $TERM == 'xterm-256color'
	set termguicolors " 设置真彩色
endif
" }}}

" Misc: {{{2
" 关闭错误响铃
set noerrorbells
set novisualbell
" 即时预览
"set inccommand=split  " 命令的更改会在preview中显示
set inccommand=nosplit  " 命令更改会在原位置显示
set completeopt-=preview " 去掉补全时烦人的预览窗口
set completeopt+=noselect,noinsert
set smartindent " 智能缩进
"set smartcase " 智能搜索,命令模式下补全会比较痛苦
set ignorecase " 忽略大小写
set smarttab " 智能tab
set hidden " 在当前buffer没有保存时可以切换到其他buffer
set undofile " 启用持久性撤销
set autoread " 自动读取改动的文件
set noswapfile " 不使用swapfile
set sessionoptions-=help " 保存session时不包括help信息
set whichwrap=b,s,<,>,[,]
" 设置折叠
" set foldlevel=2
" set foldlevelstart=99
" 设置自动补全
set wildmode=list:full
"set wildmode=list:longest
set wildmenu
"set wildignorecase
if has('mouse')
	set mouse=a " 如果鼠标可用则启用鼠标支持
endif
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set isfname-== " 不将=当成文件名的一部分
" 记住上次文件打开的位置 last-position-jump
au BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
			\ |   exe "normal! g`\""
			\ | endif
" }}}

" Bind: {{{2
" 翻页
nmap <C-j> <C-f>zz
nmap <C-k> <C-b>zz

" 在改变列表中移动
nmap <silent> g; g;zz
nmap <silent> g, g,zz

" 切换窗口
nmap <silent> <space>j <C-w>j
nmap <silent> <space>k <C-w>k
nmap <silent> <space>h <C-w>h
nmap <silent> <space>l <C-w>l
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-h> <C-w>h
nmap <M-l> <C-w>l

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

" 每次移动相对屏幕的一行
nmap j gj
nmap k gk

" 命令行模式移动
"cmap <C-f> <Right>
"cmap <C-b> <Left>
"cmap <M-f> <C-Right>
"cmap <M-b> <C-Left>
"cmap <C-a> <Home>
"cmap <C-e> <End>

" 终端按键绑定
" nmap <C-t> <ESC>:terminal<CR> " 进入终端
tmap <C-o> <C-\><C-n> " 进入默认模式
tmap <C-^> <C-\><C-n><C-^> " 切换buffer
tmap <A-h> <C-\><C-N><C-w>h
tmap <A-j> <C-\><C-N><C-w>j
tmap <A-k> <C-\><C-N><C-w>k
tmap <A-l> <C-\><C-N><C-w>l

let g:mapleader=','
nmap <leader>ee <ESC>:e $MYVIMRC<CR>
nmap <leader>rr <ESC>:source $MYVIMRC<CR>
nmap <leader>el <ESC>:e $HOME/.config/nvim/init_local.vim<CR>
nmap <leader>ep <ESC>:e $HOME/.config/nvim/plugin_local.vim<CR>

" }}}

" AB: {{{2

" 当前日期
iab xdate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
" 当前星期
iab xweek <C-R>="星期".strpart("日一二三四五六",strftime("%w")*3,3)<CR>
" 名字
iab xname jiazhoulvke
" 邮箱
iab xemail jiazhoulvke@gmail.com
" 个人博客
iab xblog http://www.jiazhoulvke.com

" }}}

" Plugins Config: {{{2

" echodoc: {{{3
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'echo'
"let g:echodoc#type = 'signature' " gonvim可用
" }}}

" fzf.vim: {{{3

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap gf <ESC>:Files<CR>
nmap gb <ESC>:Buffers<CR>
nmap gh <ESC>:History<CR>
nmap gt <ESC>:Tags<CR>
nmap gl <ESC>:Lines<CR>
" }}}

" session: {{{3
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_directory = '~/.local/share/nvim/sessions'
nmap <leader>s <ESC>:OpenSession<CR>
" }}}

" csscomplete: {{{3
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
" }}}

" ale: {{{3
" gometalinter参数
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}
let g:ale_go_gometalinter_options='-t --fast --disable=gocyclo --disable=gas --disable=goconst --disable=vetshadow --disable=gosec --disable=ineffassign'

nmap <silent> <C-h> <Plug>(ale_previous)
nmap <silent> <C-l> <Plug>(ale_next)
nmap <leader>a <Plug>(ale_first)
" }}}

" tpope/vim-markdown: {{{3
" let g:markdown_fenced_languages = ['html', 'css', 'python', 'bash=sh', 'golang=go', 'go', 'php'] " 需要在markdown文件中高亮的代码
" }}}

" asyncrun: {{{3
if exists('g:asyncrun_status')
	autocmd! BufWrite *.go exec ':AsyncRun! go install'
endif
" }}}

" nerdcommenter: {{{3
map <space>c <plug>NERDCommenterToggle
let NERDSpaceDelims = 1
" }}}

" nerdtree: {{{3
nmap <space>n <ESC>:NERDTreeToggle<CR>
" }}}

" EasyAlign: {{{3
xmap <space>a <Plug>(EasyAlign)
nmap <space>a <Plug>(EasyAlign)
" }}}

" ctrlsf: {{{3
nmap <space>sf <ESC>:CtrlSF<space>
nmap <space>ss <ESC>:CtrlSFToggle<CR>
" }}}

" incsearch.vim: {{{3
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)
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

let g:airline#extensions#gutentags#enabled = 1

let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

let g:airline#extensions#tabline#enabled = 1
nmap <space>1 <Plug>AirlineSelectTab1
nmap <space>2 <Plug>AirlineSelectTab2
nmap <space>3 <Plug>AirlineSelectTab3
nmap <space>4 <Plug>AirlineSelectTab4
nmap <space>5 <Plug>AirlineSelectTab5
nmap <space>6 <Plug>AirlineSelectTab6
nmap <space>7 <Plug>AirlineSelectTab7
nmap <space>8 <Plug>AirlineSelectTab8
nmap <space>9 <Plug>AirlineSelectTab9
nmap <M-p> <Plug>AirlineSelectPrevTab
nmap <M-n> <Plug>AirlineSelectNextTab

let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#open_lnum_symbol = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'
" }}}

" }}}

" webdevicons: {{{3
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" }}}

" sneak: {{{3
nmap t <Plug>Sneak_s
nmap T <Plug>Sneak_S
xmap t <Plug>Sneak_s
xmap T <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
" }}}

" vim-multiple-cursors: {{{3
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" }}}

" gutentags: {{{3 
let g:gutentags_enabled = 1
let g:gutentags_cache_dir = '~/.tags'
" }}}

" wmgraphviz.vim: {{{3
nmap <leader>gc <ESC>:GraphvizCompile<CR>
nmap <leader>gs <ESC>:GraphvizShow<CR>
" }}}

" }}}

"load local config
if filereadable($HOME.'/.config/nvim/init_local.vim')
	source ~/.config/nvim/init_local.vim
endif

" }}}

" vim: foldmethod=marker
