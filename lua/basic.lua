------------------------------------------------------------------------
--
-- basic.lua - 基础配置
--
------------------------------------------------------------------------
-- vim: set ts=4 sw=4 tw=78 noet :

-----------------------------------------------------------------------
-- 基础设置
-----------------------------------------------------------------------

-- 设置 Backspace 键模式
vim.o.backspace = "eol,start,indent"

-- 自动缩进
vim.o.autoindent = true

-- 打开 C/C++ 语言缩进优化
vim.o.cindent = true

-- Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
vim.o.winaltkeys = "no"

-- 自动换行
vim.o.wrap = true

-- 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
vim.o.ttimeout = true

-- 功能键超时检测 50 毫秒
vim.o.ttimeoutlen = 50

-- 显示光标位置
vim.o.ruler = true

-- 如鼠标可用则启用鼠标支持
if vim.fn.has("mouse") == 1 then
    vim.o.mouse = "a"
end

-- 不将=当成文件名的一部分
vim.opt.isfname:remove("=")

-----------------------------------------------------------------------
-- 搜索设置
-----------------------------------------------------------------------

-- 搜索时忽略大小写
vim.o.ignorecase = true

-- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
vim.o.smartcase = true

-- 高亮搜索内容
vim.o.hlsearch = true

-- 查找输入时动态增量显示查找结果
vim.o.incsearch = true

-----------------------------------------------------------------------
-- 编码设置
-----------------------------------------------------------------------
if vim.fn.has("multi_byte") == 1 then
    -- 内部工作编码
    vim.o.encoding = "utf-8"

    -- 文件默认编码
    vim.o.fileencoding = "utf-8"

    -- 打开文件时自动尝试下面顺序的编码
    vim.o.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1"
end

-----------------------------------------------------------------------
-- 允许 Vim 自带脚本根据文件类型自动设置缩进等
-----------------------------------------------------------------------
if vim.fn.has("autocmd") == 1 then
    vim.api.nvim_command("filetype plugin indent on")
end

-----------------------------------------------------------------------
-- 语法高亮设置
-----------------------------------------------------------------------
if vim.fn.has("syntax") == 1 then
    vim.api.nvim_command("syntax enable")
    vim.api.nvim_command("syntax on")
end

-----------------------------------------------------------------------
-- 其他设置
-----------------------------------------------------------------------

-- 显示匹配的括号
vim.o.showmatch = true

-- 显示括号匹配的时间
vim.o.matchtime = 2

-- 显示最后一行
vim.o.display = "lastline"

-- 允许下方显示目录
vim.o.wildmenu = true

-- 设置补全模式
vim.o.wildmode = "list:full"

-- 延迟绘制（提升性能）
vim.o.lazyredraw = true

-- 错误格式
vim.opt.errorformat:append("[%f:%l] -> %m,[%f:%l]:%m]]")
-- 设置分隔符可视
vim.o.listchars = "tab:| ,trail:.,extends:>,precedes:<"

-- 保存session时不包括help信息
vim.opt.sessionoptions:remove("help")

-- 使指定的左右移动光标的键在行首或行尾可以移到前一行或者后一行
vim.o.whichwrap = "b,s,<,>,[,]"

-- 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
-- 或者 Vim 当前目录包含 .tags 文件
vim.o.tags = "./.tags;,.tags"

-- 如遇Unicode值大于255的文本，不必等到空格再折行
vim.opt.formatoptions:append("m")

-- 合并两行中文时，不在中间加空格
vim.opt.formatoptions:append("B")

-- 文件换行符，默认使用 unix 换行符
vim.o.ffs = "unix,dos,mac"

-----------------------------------------------------------------------
-- 设置代码折叠
-----------------------------------------------------------------------
if vim.fn.has("folding") == 1 then
    -- 允许代码折叠
    vim.o.foldenable = true

    -- 代码折叠默认使用缩进
    vim.o.fdm = "indent"

    -- 如果用的 neovim 版本大于 0.6 则可以使用 tree-sitter
    -- 将折叠方式设为表达式
    if vim.fn.has("nvim-0.6") == 1 then
        vim.o.fdm = "expr"
    end

    -- 默认打开所有缩进
    vim.o.foldlevel = 99
end

-----------------------------------------------------------------------
-- 文件搜索和补全时忽略下面扩展名
-----------------------------------------------------------------------
vim.api.nvim_command("set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class")

-- stuff to ignore when tab completing
vim.opt.wildignore = "*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib,a.out"
vim.opt.wildignore:append("*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex")
vim.opt.wildignore:append('*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux')
vim.opt.wildignore:append("*DS_Store*,*.ipch")
vim.opt.wildignore:append("*.gem")
vim.opt.wildignore:append("*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso")
vim.opt.wildignore:append("*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**")
vim.opt.wildignore:append("*/.nx/**,*.app,*.git,.git")
vim.opt.wildignore:append("*.wav,*.mp3,*.ogg,*.pcm")
vim.opt.wildignore:append("*.mht,*.suo,*.sdf,*.jnlp")
vim.opt.wildignore:append("*.chm,*.epub,*.pdf,*.mobi,*.ttf")
vim.opt.wildignore:append("*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc")
vim.opt.wildignore:append("*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps")
vim.opt.wildignore:append("*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu")
vim.opt.wildignore:append("*.gba,*.sfc,*.078,*.nds,*.smd,*.smc")
vim.opt.wildignore:append("*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android")

-- 设置 leader 键为空格
vim.g.mapleader = " "

------------------------------------------------------------------------
-- 禁用一些使用机率不高的自带插件
------------------------------------------------------------------------
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logipat = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zipPlugin = 1

-----------------------------------------------------------------------
-- 有 tmux 和没有的功能键超时（毫秒）{{{
-----------------------------------------------------------------------
if vim.env.TMUX ~= "" then
    vim.o.ttimeoutlen = 30
elseif vim.o.ttimeoutlen > 80 or vim.o.ttimeoutlen <= 0 then
    vim.o.ttimeoutlen = 80
end
-- }}}
-----------------------------------------------------------------------

------------------------------------------------------------------------
-- 备份设置
------------------------------------------------------------------------

-- 允许备份
vim.o.backup = true

-- 保存时备份
vim.o.writebackup = true

-- 备份文件目录
vim.o.backupdir = vim.fn.expand("~/.cache/nvim/backup")
vim.fn.mkdir(vim.fn.expand("~/.cache/nvim/backup"), "p", 0755)

-- 备份文件扩展名
vim.o.backupext = ".bak"

-- 禁用交换文件
vim.o.swapfile = false

-- 启用 undo文件
vim.o.undofile = true

------------------------------------------------------------------------
-- tab设置
------------------------------------------------------------------------

-- 设置缩进宽度
vim.o.shiftwidth = 4

-- 设置 TAB 宽度
vim.o.tabstop = 4

-- 禁止展开 tab (noexpandtab)
vim.o.expandtab = false

-- 如果后面设置了 expandtab 那么展开 tab 为多少字符
vim.o.softtabstop = 4

vim.cmd(
    [[
augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END
    ]]
)

------------------------------------------------------------------------
-- 文件类型微调
------------------------------------------------------------------------
vim.cmd(
    [[
augroup InitFileTypesGroup

" 清除同组的历史 autocommand
au!

" lua 
au FileType lua setlocal ts=2 sw=2 et

" lisp 进行微调
au FileType lisp setlocal ts=8 sts=2 sw=2 et

" scala 微调
au FileType scala setlocal sts=4 sw=4 noet

" haskell 进行微调
au FileType haskell setlocal et

" quickfix 隐藏行号
au FileType qf setlocal nonumber

" 强制对某些扩展名的 filetype 进行纠正
au BufNewFile,BufRead *.as setlocal filetype=actionscript
au BufNewFile,BufRead *.pro setlocal filetype=prolog
au BufNewFile,BufRead *.es setlocal filetype=erlang
au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
au BufNewFile,BufRead *.vl setlocal filetype=verilog
augroup END
]]
)
