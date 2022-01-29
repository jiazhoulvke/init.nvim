-- vim: set ts=4 sw=4 tw=78 noet fdm=marker :

vim.cmd([[

"----------------------------------------------------------------------
" 杂项
"----------------------------------------------------------------------
" 进入当前buffer所在目录
nnoremap <leader>cd <ESC>:cd %:p:h<CR>

" 去高亮
nnoremap <leader><leader> <ESC>:nohlsearch<CR>

" 终端按键绑定
tnoremap <C-^> <C-\><C-n><C-^> " 切换buffer

" 删除^M
nnoremap <leader>xm <ESC>:%s/\r$//<CR>

" 删除空行
" nnoremap <leader>xl :g/^\s*$/d<CR>


"----------------------------------------------------------------------
" 编辑
"----------------------------------------------------------------------
" 列选择模式
nnoremap vv <C-Q>

" Ctrl+C复制
vmap <C-C> "+y

" CTRL-X剪切
vmap <C-X> "+x

" CTRL-V粘贴
vmap <C-V> "+gp
cmap <C-v> <C-r>+
" 粘贴时禁止缩进
imap <C-v> <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>
" 粘贴时禁止缩进
nnoremap <C-v> <ESC>:set paste<CR>:normal "+gP:set nopaste<CR>

" 插入模式下上开一行
inoremap <M-cr> <Esc>O

" 删除后面的字符
inoremap <C-d> <DEL>

" 删除一个词
inoremap <M-BS> <C-w>

" 用Tab缩进
nnoremap <Tab> v>
nnoremap <S-Tab> v<
vnoremap <Tab> >
vnoremap <S-Tab> <

"----------------------------------------------------------------------
" 保存
"----------------------------------------------------------------------
nnoremap <M-s> <ESC>:update<CR>
inoremap <M-s> <ESC>:update<CR>

"----------------------------------------------------------------------
" 折叠
"----------------------------------------------------------------------
" 用'切换折叠状态
nnoremap ' za

"----------------------------------------------------------------------
" 普通模式下复制文件路径
nnoremap <C-c> :let @+=expand('%:p')<CR>
"----------------------------------------------------------------------

"----------------------------------------------------------------------
" NORMAL 模式下翻页
"----------------------------------------------------------------------
nnoremap <M-d> <C-f>zz
nnoremap <M-e> <C-b>zz
nnoremap <M-n> <C-f>zz
nnoremap <M-p> <C-b>zz

"----------------------------------------------------------------------
" 在改变列表中移动
"----------------------------------------------------------------------
nnoremap <silent> g; g;zz
nnoremap <silent> g, g,zz

"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>


"----------------------------------------------------------------------
" ALT 键移动增强
"----------------------------------------------------------------------

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
inoremap <m-h> <c-left>
inoremap <m-l> <c-right>

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转）
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk

" 命令模式下的相同快捷
cnoremap <m-h> <c-left>
cnoremap <m-l> <c-right>


"----------------------------------------------------------------------
" 关闭窗口
"----------------------------------------------------------------------
nnoremap <M-c> <ESC>:quit<CR>
inoremap <M-c> <ESC>:quit<CR>


"----------------------------------------------------------------------
" 窗口切换：ALT+hjkl
"----------------------------------------------------------------------
noremap <M-h> <C-w>h
noremap <M-l> <C-w>l
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k

inoremap <M-h> <Esc><C-w>h
inoremap <M-l> <Esc><C-w>l
inoremap <M-j> <Esc><C-w>j
inoremap <M-k> <Esc><C-w>k

tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-l> <C-\><C-n><C-w>l
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-q> <C-\><C-n>


"----------------------------------------------------------------------
" QuickFix 按键配置
"----------------------------------------------------------------------
autocmd! FileType qf nmap <buffer> q <ESC>:cclose<CR>
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> \q <ESC>:call ToggleQuickFix()<CR>

]])
