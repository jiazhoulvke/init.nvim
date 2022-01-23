Plug 'tommcdo/vim-exchange', { 'on': ['<Plug>(ExchangeLine)', '<Plug>(Exchange)'] } " 用cxiw交换单词、cxi'交换‘中的文字等

let g:exchange_no_mappings = 1
nmap cxx <Plug>(ExchangeLine)
nmap cxc <Plug>(ExchangeClear)
nmap cx <Plug>(Exchange)
xmap X <Plug>(Exchange)
