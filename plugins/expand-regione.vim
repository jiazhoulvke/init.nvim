" 逐步扩大选择区域
Plug 'terryma/vim-expand-region'

let g:expand_region_text_objects = {
			\ 'iw': 0,
			\ "i'": 0,
			\ "a'": 0,
			\ "i`": 0,
			\ "a`": 0,
			\ 'i"': 0,
			\ 'a"': 0,
			\ "i[": 1,
			\ "a[": 1,
			\ "i<": 1,
			\ "a<": 1,
			\ "it": 1,
			\ "at": 1,
			\ 'i(': 1,
			\ 'a(': 1,
			\ "i}": 1,
			\ "a}": 1,
	\ }
call expand_region#custom_text_objects('go', {
			\ 'i,': 0,
			\ 'a,': 0,
			\ 'if': 0,
			\ 'af': 0,
			\ 'ic': 0,
			\ 'ac': 0,
      \ })
nmap <CR> <Plug>(expand_region_expand)
vmap <CR> <Plug>(expand_region_expand)
nmap <BS> <Plug>(expand_region_shrink)
vmap <BS> <Plug>(expand_region_shrink)
