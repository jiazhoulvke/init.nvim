" 部分配置参考 https://github.com/skywind3000/vim-init

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:my_vim_config_path = s:home

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" 定义一个命令用来编辑文件
command! -nargs=1 EditScript exec 'edit '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim

"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 如果存在本地预设文件则载入
if has('nvim')
	if filereadable(s:home.'/init/preset.vim')
		LoadScript init/preset.vim
	endif
else
	if filereadable(expand('~/.vim/preset.vim'))
		exec 'so '.expand('~/.vim/preset.vim')
	endif
endif

" 加载基础配置
LoadScript init/basic.vim

" 加载扩展配置
LoadScript init/config.vim

" 设定 tabsize
LoadScript init/tabsize.vim

" 加载插件
LoadScript init/plugins.vim

" 界面样式
LoadScript init/style.vim

" 自定义按键
LoadScript init/keymaps.vim

" 自定义缩写
LoadScript init/ab.vim

" 本地配置
if has('nvim') && filereadable(s:home.'/init.local.vim')
	LoadScript init.local.vim
endif
if !has('nvim') && filereadable(expand('~/.vim/init.local.vim'))
	exec 'so '.expand('~/.vim/init.local.vim')
endif
