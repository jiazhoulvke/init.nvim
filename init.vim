" Plugins: {{{1
	call plug#begin('~/.local/share/nvim/plugged')

	" Misc: {{{2
	Plug 'Chiel92/vim-autoformat' "代码自动格式化
	Plug 'Shougo/vimproc.vim', {'do' : 'make'} "异步运行库
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' "代码片段
	Plug 'Valloric/MatchTagAlways' "tag配对显示
	Plug 'ctrlpvim/ctrlp.vim' "文件、buffer、tag、历史文件浏览
	Plug 'dyng/ctrlsf.vim' "文件内容查找
	Plug 'gregsexton/gitv' "git工具,类似于tig
	Plug 'haya14busa/incsearch.vim' "对vim自带搜索的强化，可以同时搜索多个词
	Plug 'idanarye/vim-vebugger' "Debug工具，支持gdb、lldb等多种工具
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "基于文件名快速搜索文件
	Plug 'junegunn/vim-easy-align' "代码对齐
	Plug 'justinmk/vim-sneak' "快速移动,类似vim自带的f，但sneak支持多行
	Plug 'majutsushi/tagbar' "显示tag
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "文件浏览器
	Plug 'sk1418/Join' "比vim自带的join更强大
	Plug 'skywind3000/asyncrun.vim' "异步执行命令
	Plug 'terryma/vim-expand-region' "逐步扩大选择区域
	Plug 'terryma/vim-multiple-cursors' "多重选择
	Plug 'tpope/vim-fugitive' "对git的封装
	Plug 'tpope/vim-repeat' "重复执行操作
	Plug 'tpope/vim-surround' "对括号双引号等进行快速编辑
	Plug 'vim-scripts/LargeFile' "针对大文件优化性能
	Plug 'vim-scripts/VisIncr' " 列编辑
	Plug 'w0rp/ale' "异步代码检测
	Plug 'xolox/vim-misc' "库
	Plug 'xolox/vim-notes' "vim写日记
	Plug 'xolox/vim-session' "管理session
	"Plug 'Shougo/unite.vim'
	"Plug 'Shougo/unite-outline'
	"Plug 'Shougo/neomru.vim'

	" }}}

	" UI: {{{2
	Plug 'altercation/vim-colors-solarized'
	Plug 'bling/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'lilydjwg/colorizer',{'for': ['html', 'php', 'css']}
	" }}}

	" Languages: {{{2
	Plug 'tpope/vim-markdown' "支持在markdown中高亮代码块
	Plug 'groenewege/vim-less'
	"Plug 'pangloss/vim-javascript'
	"Plug 'cespare/vim-toml'
	"Plug 'chr4/nginx.vim'
	"Plug 'vim-scripts/gtk-vim-syntax'
	"Plug 'vim-scripts/jQuery'
	"Plug 'jansenm/vim-cmake'
	"Plug 'leafgarland/typescript-vim'
	"Plug 'mitsuhiko/vim-jinja'
	"Plug 'peterhoeg/vim-qml'
	"Plug 'vim-scripts/tornadotmpl.vim'
	"Plug 'xolox/vim-lua-ftplugin'
	"Plug 'corylanou/vim-present'
	" }}}

	" Completion: {{{2
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "新一代补全框架

	Plug 'Shougo/context_filetype.vim' "根据上下文补全，比如可以在markdown文件中补全golang代码
	Plug 'Shougo/echodoc.vim' "不用preview窗口也能显示函数参数
	Plug 'Shougo/neco-syntax' "语法补全
	Plug 'Shougo/neco-vim' "vimscript补全
	Plug 'carlitux/deoplete-ternjs' "js补全
	Plug 'fatih/vim-go' "golang补全
	Plug 'zchee/deoplete-go', { 'do': 'make'} "golang补全
	Plug 'mattn/emmet-vim', {'for': ['php', 'html', 'css', 'xml']} "html、css代码片段
	Plug 'mhartington/nvim-typescript' "typescript补全
	Plug 'othree/csscomplete.vim' "css补全
	Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' } "php补全
	"Plug 'phpactor/phpactor' ,  {'do': 'composer install'} "php补全
	Plug 'scrooloose/nerdcommenter' "注释插件
	Plug 'zchee/deoplete-zsh' "zsh补全
	"Plug 'zchee/deoplete-clang' " Clang补全

	"}}}

	call plug#end()
" }}}

" Config: {{{1

	" Plugins: {{{2

		" deoplete.nvim: {{{3
		"let g:deoplete#enable_at_startup = 1
		let g:deoplete#enable_at_startup = 0
		autocmd InsertEnter * call deoplete#enable() "仅在进入插入模式时启用deoplete,加快启动速度
		" }}}

		" echodoc: {{{3
		let g:echodoc#enable_at_startup = 1
		let g:echodoc#type = 'echo'
		"let g:echodoc#type = 'signature' "gonvim可用
		" }}}

		" session: {{{3
		let g:session_autoload = 'no'
		let g:session_autosave = 'yes'
		" }}}

		" csscomplete: {{{3
		autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
		" }}}

		" vebugger: {{{3
		let g:vebugger_leader='<leader>d'
		" }}}

		" ale: {{{3
		" gometalinter参数
		let g:ale_go_gometalinter_options='-t --fast --disable=gocyclo --disable=gas --disable=goconst --disable=vetshadow  --disable=ineffassign'
		" }}}

		" tpope/vim-markdown: {{{3
		let g:markdown_fenced_languages = ['html', 'css', 'python', 'bash=sh', 'golang=go', 'go', 'php'] "需要在markdown文件中高亮的代码
		" }}}

		" asyncrun: {{{3
		if exists('g:asyncrun_status')
			autocmd! BufWrite *.go exec ':AsyncRun go install'
		endif
		" }}}

		" nerdcommenter: {{{3
		map <space>c <plug>NERDCommenterToggle
		" }}}

		" nerdtree: {{{3
		nmap <space>n <ESC>:NERDTreeToggle<CR>
		" }}}

		" notes: {{{3
		if !exists('g:notes_directories')
			let g:notes_directories = [$HOME.'/Dropbox/notes']
		else
			echo g:notes_directories
		endif
		" }}}

		" gitv: {{{3
		let g:Gitv_OpenHorizontal = 0
		" }}}

		" tagbar: {{{3
		let g:tagbar_show_visibility = 1
		nmap <space>t <ESC>:TagbarToggle<CR>
		" }}}

		" fzf: {{{3
		nmap <leader>f <ESC>:FZF<CR>
		" }}}

		" EasyAlign: {{{3
		xmap <space>a <Plug>(EasyAlign)
		nmap <space>a <Plug>(EasyAlign)
		" }}}

		" ctrlp: {{{3
		if executable("ag")
			set grepprg=ag\ --nogroup\ --nocolor
			let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
			let g:ctrlp_use_caching = 0
		endif
		let g:ctrlp_match_window = 'bottom,ttb,min:1,max:20,results:99'
		nmap <space>b <ESC>:CtrlPBuffer<CR>
		nmap <space>m <ESC>:CtrlPMRU<CR>
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
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif

		let g:airline_left_sep = '⮀'
		let g:airline_left_alt_sep = '⮁'
		let g:airline_right_sep = '⮂'
		let g:airline_right_alt_sep = '⮃'
		let g:airline_symbols.branch = '⭠'
		let g:airline_symbols.readonly = '⭤'
		let g:airline_symbols.linenr = '⭡'

		let g:airline#extensions#tagbar#enabled = 1
		let g:airline#extensions#syntastic#enabled = 1
		let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

		let g:airline_theme='powerlineish'
		" }}}
		
		" sneak: {{{3
		nmap s <Plug>Sneak_s
		nmap S <Plug>Sneak_S
		xmap s <Plug>Sneak_s
		xmap S <Plug>Sneak_S
		nmap f <Plug>Sneak_f
		nmap F <Plug>Sneak_F
		xmap f <Plug>Sneak_f
		xmap F <Plug>Sneak_F
		" }}}
		
		" vim-multiple-cursors: {{{3
		" multiple-cursors和deoplete有冲突，要在使用multiple-cursors时自动关闭deoplete
       	function! g:Multiple_cursors_before()
       	  let g:deoplete#disable_auto_complete = 1
       	endfunction
       	function! g:Multiple_cursors_after()
       	  let g:deoplete#disable_auto_complete = 0
       	endfunction
		" }}}
	"}}}

	" Misc: {{{2
	" 关闭错误响铃
	set noerrorbells
	set novisualbell
	" 即时预览
	"set inccommand=split  " 命令的更改会在preview中显示
	set inccommand=nosplit  " 命令更改会在原位置显示
	set completeopt-=preview "去掉烦人的预览窗口
	set completeopt+=noselect,noinsert
	set smartindent "智能缩进
	set smartcase "智能搜索
	set smarttab "智能tab
	set hidden "在当前buffer没有保存时可以切换到其他buffer
	set undofile " 启用持久性撤销
	set sessionoptions-=help "保存session时不包括help信息
	set whichwrap=b,s,<,>,[,]
	" 设置自动补全
	set wildmode=list:full
	set wildmenu
	if has('mouse')
		set mouse=a "如果鼠标可用则启用鼠标支持
	endif
	set isfname-== "不将=当成文件名的一部分
	" 记住上次文件打开的位置
	au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
	" }}}

	" UI: {{{2
	set number "启用行号
	set tabstop=4 "tab宽度设为4
	set shiftwidth=4 "换行宽度设为4
	autocmd FileType html,xml,yaml setlocal tabstop=2 shiftwidth=2
	set background=dark
	colo solarized
	set shortmess+=c "关掉一些烦人的信息
	"set cmdheight=2 "命令行高度设为2，echodoc需要
	set noshowmode "不显示当前状态
	set display=lastline "解决超长行显示异常的问题
	set lazyredraw "不立即重绘
	set cursorline "高亮当前行
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

	" 进入当前buffer所在目录
	nmap <leader>cd <ESC>:cd %:p:h<CR>

	" 删除^M
	nmap <Leader>dm mmHmn:%s/<C-V><cr>//ge<cr>'nzt'm

	" 删除空行
	nmap <Leader>dbl :g/^\s*$/d<CR>

	" 每次移动相对屏幕的一行
	nmap j gj
	nmap k gk

	" 命令行模式移动
	cmap <C-f> <Right>
	cmap <C-b> <Left>
	cmap <M-f> <C-Right>
	cmap <M-b> <C-Left>
	cmap <C-a> <Home>
	cmap <C-e> <End>

	" 终端按键绑定
	nmap <C-t> <ESC>:terminal<CR> " 进入终端
  	tmap <Esc> <C-\><C-n> " 进入默认模式
	tmap <C-^> <C-\><C-n><C-^> "切换buffer
	tmap <A-h> <C-\><C-N><C-w>h
	tmap <A-j> <C-\><C-N><C-w>j
	tmap <A-k> <C-\><C-N><C-w>k
	tmap <A-l> <C-\><C-N><C-w>l

	let mapleader=','
	nmap <leader>ee <ESC>:e $MYVIMRC<CR>
	nmap <leader>rr <ESC>:source $MYVIMRC<CR>
	nmap <leader>el <ESC>:e $HOME/.config/nvim/init_local.vim<CR>

	func! GoPlay()
		let output=system('mktemp -p $GOPATH/src -d')
		let tempfolder=split(output,'\n')[0]
		let main=tempfolder.'/main.go'
		call system('touch '.main)
		call writefile(['package main', '', 'import (','"fmt"',')', '', 'func main() {', '', '}'], main)
		exec ':lcd '.tempfolder
		exec ':e main.go'
	endfunc
	map <leader>pg <ESC>:call GoPlay()<CR>

	func! PHPPlay()
		let output=system('mktemp -d')
		let tempfolder=split(output,'\n')[0]
		let main=tempfolder.'/main.php'
		call system('touch '.main)
		call writefile(['<?php',''], main)
		exec ':lcd '.tempfolder
		exec ':e main.php'
	endfunc
	map <leader>pp <ESC>:call PHPPlay()<CR>

	" 一键运行单个文件
	let g:RunFile_Params=''
	nmap <space>rr <ESC>:call RunFile()<CR>
	nmap <space>rp <ESC>:call RunFileWithParams()<CR>

	func! RunFileWithParams()
		let g:RunFile_Params=input('请输入参数:')
		call RunFile()
	endfunc

	func! RunFile()
		if &filetype=='vim'
			source %
		elseif &filetype=='python'
			if stridx(getline(1), 'python3') == -1
				exec '!python % '.g:RunFile_Params
			else
				exec '!python3 % '.g:RunFile_Params
			endif
		elseif &filetype=='dot'
			exec '!dot -Tpng -o '.expand('%:p:r').'.png'.' '.expand('%').' && display '.expand('%:p:r').'.png'
		elseif &filetype=='lua'
			exec '!lua % '.g:RunFile_Params
		elseif &filetype=='go'
			exec ':!go run % '.g:RunFile_Params
		elseif &filetype=='php'
			exec ':!php % '.g:RunFile_Params
		elseif &filetype=='c'
			let l:makefile = "Makefile"
			let l:key = "vim_run_object"
			if filereadable(l:makefile)
				let l:content = join(readfile(l:makefile),"\n")
				let l:start = stridx(l:content,l:key)
				if l:start != -1
					let l:start = l:start + strlen(l:key)+1
					let l:end = stridx(l:content,"\n",l:start)
					let l:object = strpart(l:content,l:start,l:end-l:start)
					exe "make" | exe "!./".l:object.' '.g:RunFile_Params
				endif
			else
				if exists('g:ccprg')
					let b:ccprg = g:ccprg
				else
					let b:ccprg = 'gcc'
				endif
				if exists('g:ccopt')
					let b:ccopt = g:ccopt
				else
					let b:ccopt = ''
				endif
				exe '!' . b:ccprg . ' ' . b:ccopt . ' '  . ' "' . expand('%:p') . '" -o "' . expand('%:p:r') . '"'
				exe '!' . expand('%:p:r').' '.g:RunFile_Params
			endif
		elseif &filetype=='html' || &filetype=='xhtml'
			if executable('google-chrome')
				exe '!google-chrome "' . expand('%:p') . '"'
			elseif executable('chromium-browser')
				exe '!chromium-browser "' . expand('%:p') . '"'
			elseif executable('firefox')
				exe '!firefox "' . expand('%:p') . '"'
			endif
		elseif &filetype=='sh' && executable(expand('%:p'))
			exe '!sh "' . expand('%:p') . '"'
		elseif expand('%') == '.Xdefaults'
			!xrdb ~/.Xdefaults
		endif
	endfunc

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

" }}}


" vim: foldmethod=marker sw=2 ts=2
