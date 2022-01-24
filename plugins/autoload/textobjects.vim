Plug 'junegunn/vim-after-object' " Defines text objects to target text after the designated characters.
Plug 'kana/vim-textobj-user' " Create your own text objects
Plug 'jceb/vim-textobj-uri' " Text objects for dealing with URIs. *u*
Plug 'kana/vim-textobj-datetime' " Text objects for date and time. *da*, *dd*, *df*, *dt*, *dz*
Plug 'kana/vim-textobj-entire' " Text objects for entire buffer. *e*
Plug 'kana/vim-textobj-fold' " Text objects for foldings. *z*
Plug 'kana/vim-textobj-indent' " Text objects for indented blocks of lines. *i*, *I*
Plug 'wellle/targets.vim' " Vim plugin that provides additional text objects: ({[<t(tags)

" vim-after-object: {{{
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" }}}
