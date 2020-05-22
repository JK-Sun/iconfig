syntax enable
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set autoread
set so=7
set ai    "Auto indent
set si    "Smart indent
set wrap  "Wrap lines
set hidden

" Leader Key
let mapleader = ','

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Ignore case when searching
set ignorecase
set smartcase

" Fast saving
nmap <leader>w :w!<cr>

" Control d
map <space> <C-d>

" Tab config
set ts=2
set sw=2
set smarttab
set et
set ambiwidth=double
set smarttab

" Window config
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" Strip
autocmd BufWritePre * :%s/\s\+$//e

" Copy and Paste
vmap <leader>y "+y
vmap <leader>p "+p

" Cursor color
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


""""""""""""""""""""""""""""""
" => Plugs
""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-scripts/peaksea'

Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/nerdtree'

Plug 'Raimondi/delimitMate'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

call plug#end()


""""""""""""""""""""""""""""""
" => peaksea plugin
" => 主题插件
""""""""""""""""""""""""""""""
if ! has("gui_running")
  set t_Co=256
endif

set background=dark
colors peaksea


""""""""""""""""""""""""""""""
" => NERDTree plugin
" => 树型目录
""""""""""""""""""""""""""""""
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=30
let g:NERDTreeWinPos = "right"
autocmd vimenter * if !argc() | NERDTree | endif
nmap wm :NERDTree<cr>
nmap wn :NERDTreeFind<cr>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
" => 已打开文件列表
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
nmap mm :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => fzf plugin
" => 全局搜索文件、文件内容
""""""""""""""""""""""""""""""
let $FZF_DEFAULT_OPTS = '--layout=reverse'
map <leader>f :Files<cr>
map <leader>g :Rg<cr>


""""""""""""""""""""""""""""""
" => coc plugin
" => 代码自动补全、代码跳转
""""""""""""""""""""""""""""""
map <C-b> :call CocAction('jumpDefinition')<cr>
