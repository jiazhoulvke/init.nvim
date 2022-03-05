" Create your own text objects
Plug 'kana/vim-textobj-user'
" Text objects for dealing with URIs. *u*
Plug 'jceb/vim-textobj-uri'
" Text objects for date and time. *da*, *dd*, *df*, *dt*, *dz*
Plug 'kana/vim-textobj-datetime'
" Text objects for entire buffer. *e*
Plug 'kana/vim-textobj-entire'
" Text objects for foldings. *z*
Plug 'kana/vim-textobj-fold'
" Text objects for indented blocks of lines. *i*, *I*
Plug 'kana/vim-textobj-indent'
" Vim plugin that provides additional text objects: ({[<t(tags)
Plug 'wellle/targets.vim'
" Vim text objects for comments. *c*
Plug 'glts/vim-textobj-comment'
" vim-textobj-parameter is a Vim plugin to provide text objects (a, and i, by default) to select parameters of functions.
Plug 'sgur/vim-textobj-parameter'
" Defines text objects to target text after the designated characters.
Plug 'junegunn/vim-after-object'
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

