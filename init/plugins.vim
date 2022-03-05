"======================================================================
"
" plugins.vim - 插件配置
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet fdm=marker foldlevel=1


" helper {{{
"
" 插件载入流程：
" 先载入 plugins/autoload 中的插件
" 再判断是 vim 还是 neovim 分别载入plugins/autoload/{neovim,vim} 中的插件
" 接下来根据配置文件去 g:plugins_search_path 找对应名称的插件

" 配置主目录
let s:vim_home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

if !exists('g:plugins_search_path')
	let g:plugins_search_path = [s:vim_home.'/plugins.local', s:vim_home.'/plugins']
endif

if exists('g:plugins_search_path_extend') && type('g:plugins_search_path_extend') == v:t_list
	call extend(g:plugins_search_path, g:plugins_search_path_extend)
endif

" 已载入插件列表
let g:loaded_plugins = {}
" 插件文件列表
let s:plugin_files = []
" 插件列表
let s:plugins = []

" 判断插件是否已载入
function! PluginIsLoaded(plugin_name) abort
	return has_key(g:loaded_plugins, a:plugin_name)
endfunction

let s:vim_type = 'vim'
if has('nvim')
	let s:vim_type = 'neovim'
endif

" 通过名称搜索载入插件
function! s:load_plugins_by_name(plugin_name) abort
	let pgfiles = s:search_plugins_files(a:plugin_name)
	if empty(pgfiles)
		return
	endif
	call s:add_plugin(a:plugin_name, pgfiles)
	call extend(s:plugin_files, pgfiles)
	for f in pgfiles
		call extend(s:plugins, s:get_plugins_from_file(f))
	endfor
endfunction

" 从指定目录搜索插件
function! s:search_plugins_files(plugin_name) abort
	let files = []
	let found = 0
	for p in g:plugins_search_path
		let pgfile = p.'/'.a:plugin_name.'.vim'
		if filereadable(pgfile)
			call add(files, fnamemodify(pgfile,':p'))
			let found=found+1
		endif
		let pgfile = p.'/'.s:vim_type.'/'.a:plugin_name.'.vim'
		if filereadable(pgfile)
			call add(files, fnamemodify(pgfile,':p'))
			let found=found+1
		endif
		" 如果是 neovim 则另外会查找 .nvim 后缀文件
		if s:vim_type == 'neovim'
			let pgfile = p.'/neovim/'.a:plugin_name.'.nvim'
			if filereadable(pgfile)
				let found=found+1
				call add(files, fnamemodify(pgfile,':p'))
			endif
		endif
	endfor
	if found == 0
		echomsg 'plugin ['.a:plugin_name.'] not found'
	endif
	return files
endfunction

function! s:add_plugin(plugin_name, pgfiles) abort
	if has_key(g:loaded_plugins, a:plugin_name)
		call extend(g:loaded_plugins[a:plugin_name], a:pgfiles)
	else
		let g:loaded_plugins[a:plugin_name] = a:pgfiles
	endif
endfunction

" 从文件获取插件列表
function! s:get_plugins_from_file(pgfile) abort
	if !filereadable(a:pgfile)
		return []
	endif
	let plugins = []
	for line in readfile(a:pgfile, '', 100)
		if match(line, '^\s*\s*Plug\s\+'."'".'\(.\{-}\)'."'") > -1
			if index(plugins, line) == -1
				call add(plugins, line)
			endif
		endif
	endfor
	return plugins
endfunction


" 定义一个命令用来加载插件
command! -nargs=1 -bar LoadPlugins call s:load_plugins_by_name('<args>')

" }}}

" 自动载入指定目录的插件
function! s:autoload_plugins_from_dir(p) abort
	if !isdirectory(a:p)
		return
	endif
	for f in readdir(a:p)
		let pgfile = fnamemodify(a:p.'/'.f,':p')
		if !filereadable(pgfile)
			continue
		endif
		let plugin_name = fnamemodify(pgfile, ':t:r')
		call s:add_plugin(plugin_name, [pgfile])
		call add(s:plugin_files, pgfile)
		call extend(s:plugins, s:get_plugins_from_file(pgfile))
	endfor
endfunction

" 自动载入插件
for p in g:plugins_search_path
	call s:autoload_plugins_from_dir(p.'/autoload')
	call s:autoload_plugins_from_dir(p.'/autoload/'.s:vim_type)
endfor

" 加载 neovim 插件
if has('nvim') && filereadable(s:vim_home.'/init/plugins-neovim.vim')
	LoadScript init/plugins-neovim.vim
endif

" 加载 vim 插件
if !has('nvim') && filereadable(s:vim_home.'/init/plugins-vim.vim')
	LoadScript init/plugins-vim.vim
endif

" 载入本地插件配置
if has('nvim')
	if filereadable(s:vim_home.'/init/plugins.local.vim')
		LoadScript init/plugins.local.vim
	endif
else
	if filereadable(expand('~/.vim/plugins.local.vim'))
		exe 'source ' . expand('~/.vim/plugins.local.vim')
	endif
endif


" 开始载入插件
call plug#begin(get(g:, 'plugin_home', '~/.local/share/nvim/plugged'))
" call plug#begin('~/.local/share/nvim/plugged')

" 载入插件
for line in s:plugins
	exec line
endfor

" 结束插件载入
call plug#end()

" 载入插件配置
for plugin in s:plugin_files
	exec 'so '.plugin
endfor

