Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

" asyncrun: {{{
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = [".root.vim", "go.mod", ".git", ".svn", ".hg"]

" Modern Task System for Project Building, Testing and Deploying
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
" }}}

" asynctasks: {{{
let g:asynctasks_config_name = ".tasks.ini"
let g:asynctasks_term_pos = "bottom"
let g:asynctasks_term_rows = 10

nnoremap <silent> <leader>rr <ESC>:silent AsyncTask file-run<CR>
nnoremap <silent> <leader>rp <ESC>:silent AsyncTask project-run<CR>
nnoremap <silent> <leader>bb <ESC>:silent call AsyncTaskDo('file-build')<CR>
nnoremap <silent> <leader>bp <ESC>:silent call AsyncTaskDo('project-build')<CR>
nnoremap <silent> <leader>ss <ESC>:silent call AsyncTaskDo('search')<CR>

" leaderf
function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction


function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
			\ 'source': string(function('s:lf_task_source'))[10:-3],
			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
			\ 'highlights_def': {
			\     'Lf_hl_funcScope': '^\S\+',
			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
			\ },
			\ 'help' : 'navigate available tasks from asynctasks.vim',
		\ }
nnoremap <leader>ft <ESC>:Leaderf task<CR>
" }}}
