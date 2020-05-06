" 启用鼠标
set mouse=a

" 窗口切换
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

set encoding=utf-8
set fileencoding=utf-8

" 已打开文件列表
nmap mm :BufExplorer<cr>

" 树型目录
nmap wm :NERDTree<cr>
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeWinSize=30
" let g:NERDTreeWinPos = "left"
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'

" tab 配置
set ts=2
set sw=2
set smarttab
set et
set ambiwidth=double

" 关闭ale语法检查
let g:ale_enabled = 0

call plug#begin('~/.vim_runtime/my_plugins')

" fzf用于文件搜索、全文搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

call plug#end()

" 搜索文件
map <leader>f :Files<cr>

" 全文搜索
map <leader>g :Ag<cr>
