Plug 'skywind3000/asyncrun.vim'
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


Plug 'skywind3000/asynctasks.vim'

let g:asynctasks_config_name = ".tasks.ini"
let g:asynctasks_term_pos = "bottom"
let g:asynctasks_term_rows = 10

nnoremap <silent> <leader>rr <ESC>:silent AsyncTask file-run<CR>
nnoremap <silent> <leader>rp <ESC>:silent AsyncTask project-run<CR>
nnoremap <silent> <leader>bb <ESC>:silent call AsyncTaskDo('file-build')<CR>
nnoremap <silent> <leader>bp <ESC>:silent call AsyncTaskDo('project-build')<CR>
nnoremap <silent> <leader>ss <ESC>:silent call AsyncTaskDo('search')<CR>
