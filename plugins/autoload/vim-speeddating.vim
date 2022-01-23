" use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating', { 'on': ['<Plug>SpeedDatingUp', '<Plug>SpeedDatingDown'] }

nmap <C-a> <Plug>SpeedDatingUp
nmap <C-x> <Plug>SpeedDatingDown
