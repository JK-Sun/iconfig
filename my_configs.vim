set mouse=a

nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nmap wm :NERDTree<cr>
autocmd vimenter * if !argc() | NERDTree | endif

let NERDTreeWinSize=30

set encoding=utf-8
set fileencoding=utf-8
