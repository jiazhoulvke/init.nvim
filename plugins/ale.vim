" 异步代码检测
Plug 'w0rp/ale'


" ale-lint {{{
let g:ale_list_window_size = 1
let g:ale_open_list = 1
let g:ale_set_quickfix = 1
let g:ale_lint_delay=500
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 0

" 开启解析 compile_commands 的功能
let g:ale_c_parse_compile_commands = 1
" ale 将在工程目录下的 build 和 . 中搜索 compile_commands.json
let g:ale_c_build_dir_names = ['build', '.']

if !exists('g:ale_linters')
  let g:ale_linters = {}
endif
let g:ale_linters.bash = ['shellcheck']
let g:ale_linters.c = ['clangd']
" }}}

" ale-fixers {{{
let g:ale_fix_on_save = 1
if !exists('g:ale_fixers')
	let g:ale_fixers = {}
endif

" python {{{
if executable('black')
	let g:ale_fixers.python = ['black'] " pip3 install black
elseif executable('yapf')
	let g:ale_fixers.python = ['yapf'] " pip3 install yapf
elseif executable('autopep8')
	let g:ale_fixers.python = ['autopep8'] " pip3 install autopep8
endif
" }}}

" c/cpp {{{
if executable('clang-format')
	let g:ale_fixers.c = ['clang-format'] " sudo apt install clang-format-12
	let g:ale_fixers.cpp = ['clang-format']
elseif executable('astyle')
	let g:ale_fixers.c = ['astyle'] " sudo apt install astyle
	let g:ale_fixers.cpp = ['astyle']
endif
" }}}

" bash {{{
if executable('shfmt')
	let g:ale_fixers.sh = ['shfmt'] " go install mvdan.cc/sh/v3/cmd/shfmt@latest
endif
" }}}

" javascript {{{
if executable('prettier')
	let g:ale_fixers.javascript = ['prettier'] " npm install -g prettier
elseif executable('eslint')
	let g:ale_fixers.javascript = ['eslint'] " npm install -g eslint
elseif executable('standard')
	let g:ale_fixers.javascript = ['standard'] " npm install -g standard
elseif executable('xo')
	let g:ale_fixers.javascript = ['xo'] " npm install -g xo
endif
" }}}

" typescript {{{
if executable('prettier')
	let g:ale_fixers.typescript = ['prettier'] " npm install -g prettier
elseif executable('eslint')
	let g:ale_fixers.typescript = ['eslint'] " npm install -g eslint
endif
" }}}

" json {{{
if executable('fixjson')
	let g:ale_fixers.json = ['fixjson'] " npm install -g fixjson
elseif executable('jq')
	let g:ale_fixers.json = ['jq'] " sudo apt install jq
endif
" }}}

" html {{{
if executable('prettier')
	let g:ale_fixers.html = ['prettier'] " npm install -g prettier
elseif executable('html-beautify')
	let g:ale_fixers.html = ['html-beautify'] " npm install -g js-beautify
elseif executable('tidy')
	let g:ale_fixers.html = ['tidy'] " sudo apt install tidy
endif
" }}}

" css {{{
if executable('prettier')
	let g:ale_fixers.css = ['prettier'] " npm install -g prettier
elseif executable('fecs')
	let g:ale_fixers.css = ['fecs'] " npm install -g fecs
elseif executable('stylelint')
	let g:ale_fixers.css = ['stylelint'] " npm install -g stylelint stylelint-config-standard
endif
" }}}

" xml {{{
if executable('xmllint')
	let g:ale_fixers.xml = ['xmllint'] " sudo apt install libxml2-utils
endif
" }}}

" markdown {{{
if executable('pandoc')
	let g:ale_fixers.markdown = ['pandoc'] " sudo apt install pandoc
elseif executable('textlint')
	let g:ale_fixers.markdown = ['textlint'] " npm install -g textlint
endif
" }}}

" dart {{{
if executable('dartfmt')
	let g:ale_fixers.dart = ['dartfmt']
endif
" }}}

" lua {{{
if executable('luafmt')
	let g:ale_fixers.lua = ['luafmt'] " npm install -g lua-fmt
endif
" }}}

" php {{{
if executable('php-cs-fixer')
	let g:ale_fixers.php = ['php_cs_fixer'] " https://github.com/FriendsOfPHP/PHP-CS-Fixer/blob/master/doc/installation.rst
elseif executable('phpcbf')
	let g:ale_fixers.php = ['phpcbf'] " https://phpqa.io/projects/phpcbf.html
endif
" }}}

" }}}

