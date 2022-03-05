"======================================================================
"
" keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet fdm=marker :

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
nnoremap <leader>xbl :g/^\s*$/d<CR>


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
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" <leader>+数字键 切换tab
"----------------------------------------------------------------------
if !has('nvim')
noremap <silent><leader>1 1gt<cr>
noremap <silent><leader>2 2gt<cr>
noremap <silent><leader>3 3gt<cr>
noremap <silent><leader>4 4gt<cr>
noremap <silent><leader>5 5gt<cr>
noremap <silent><leader>6 6gt<cr>
noremap <silent><leader>7 7gt<cr>
noremap <silent><leader>8 8gt<cr>
noremap <silent><leader>9 9gt<cr>
noremap <silent><leader>0 10gt<cr>
endif

"----------------------------------------------------------------------
" TAB：创建，关闭，上一个，下一个，左移，右移
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
"----------------------------------------------------------------------

if !has('nvim')
noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>
noremap <silent> <leader>to :tabonly<cr>
endif


" 左移 tab
function! Tab_MoveLeft()
	let l:tabnr = tabpagenr() - 2
	if l:tabnr >= 0
		exec 'tabmove '.l:tabnr
	endif
endfunc

" 右移 tab
function! Tab_MoveRight()
	let l:tabnr = tabpagenr() + 1
	if l:tabnr <= tabpagenr('$')
		exec 'tabmove '.l:tabnr
	endif
endfunc

if !has('nvim')
noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
noremap <silent><leader>tr :call Tab_MoveRight()<cr>
noremap <silent><m-left> :call Tab_MoveLeft()<cr>
noremap <silent><m-right> :call Tab_MoveRight()<cr>
endif


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
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
noremap <m-h> <c-w>h
noremap <m-l> <c-w>l
noremap <m-j> <c-w>j
noremap <m-k> <c-w>k
inoremap <m-h> <esc><c-w>h
inoremap <m-l> <esc><c-w>l
inoremap <m-j> <esc><c-w>j
inoremap <m-k> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
	" vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
	" 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
	" 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
	set termwinkey=<c-_>
	tnoremap <m-h> <c-_>h
	tnoremap <m-l> <c-_>l
	tnoremap <m-j> <c-_>j
	tnoremap <m-k> <c-_>k
	tnoremap <m-q> <c-\><c-n>
elseif has('nvim')
	" neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
	tnoremap <m-h> <c-\><c-n><c-w>h
	tnoremap <m-l> <c-\><c-n><c-w>l
	tnoremap <m-j> <c-\><c-n><c-w>j
	tnoremap <m-k> <c-\><c-n><c-w>k
	tnoremap <m-q> <c-\><c-n>
endif

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


"----------------------------------------------------------------------
" 配置文件
"----------------------------------------------------------------------
nnoremap <leader>ce <ESC>:EditScript init.vim<CR>
nnoremap <leader>cr <ESC>:LoadScript init.vim<CR>
nnoremap <leader>cn <ESC>:EditScript init/plugins-neovim.vim<CR>
nnoremap <leader>cv <ESC>:EditScript init/plugins-vim.vim<CR>
if has('nvim')
	nnoremap <leader>cp <ESC>:EditScript init/plugins.local.vim<CR>
	nnoremap <leader>cs <ESC>:EditScript init/preset.vim<CR>
	nnoremap <leader>cl <ESC>:EditScript init.local.vim<CR>
else
	nnoremap <leader>cp <ESC>:e ~/.vim/plugins.local.vim<CR>
	nnoremap <leader>cs <ESC>:e ~/.vim/preset.vim<CR>
	nnoremap <leader>cl <ESC>:e ~/.vim/init.local.vim<CR>
endif

"----------------------------------------------------------------------
" 让背景在透明和不透明间切换
"----------------------------------------------------------------------
if !exists('g:background_is_transparent')
    let g:background_is_transparent = 0
endif
let g:background_guibg = ''
let g:background_ctermbg = ''
function! ToggleBackground()
    if g:background_is_transparent == 0
        let g:background_guibg = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'gui')
        let g:background_ctermbg = synIDattr(synIDtrans(hlID('Normal')), 'bg', 'cterm')
        hi Normal guibg=NONE ctermbg=NONE
        let g:background_is_transparent = 1
    else
        exe 'hi Normal guibg=' . g:background_guibg . ' ctermbg=' . g:background_ctermbg
        let g:background_is_transparent = 0
    endif
endfunction
nnoremap <silent> <leader>tt <ESC>:call ToggleBackground()<CR>

