"=============================================================================
" General settings
"=============================================================================

set nocp

" Add by JK-Sun
set ff=unix
set t_Co=256
set wildmenu
set wildmode=longest:list,full
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" Tab related
set ts=2
set sw=2
set smarttab
set et
set ambiwidth=double

set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  

" Size and Position by scige
"set lines=40
"set columns=85
"winpos 655 30

" On / Off Search Highlight by scige
" map <F5> :set nohlsearch!<CR>
" map <F6> :set hlsearch!<CR>
" F5要用来刷新FileExplorer
map <F8> :set hls!<bar>set hls?<CR>

" disable cursor blink
set gcr=a:block-blinkwait0
" set gcr=a:block-blinkon0
" set guicursor=a:blinkon0
" map <F7> :set guicursor=a:blinkon0<CR>

" Ctags by scige
map <F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q include/ src/ test/<CR>
set tags+=~/.vim/tags/stl_tags

" set current directory when open file in file explorer
" 切换到其他目录时，下面的命令会导致ctags失效
"set autochdir

" 设置当文件被改动时自动载入
set autoread

" 禁止生成临时文件
set nobackup

"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" Clipboard by scige
set clipboard=unnamed

" Format related
" set tw=78
" set lbr
" set fo+=mB

" Indent related
set cin
set ai
set cino=:0g0t0(susj1

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a
set selectmode=
set mousemodel=popup
set keymodel=
set selection=inclusive

" Misc
set wildmenu
"set spell

" Encoding related
set encoding=utf-8
" set langmenu=zh_CN.UTF-8
" language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

" File type related
filetype plugin indent on

" Display related
set ru
set sm
set hls
if (has("gui_running"))
    set guioptions+=b
    colo torte
    set nowrap
else
    colo ron
    set wrap
endif
syntax on

" switch window
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" ============================================================================
" Shortcuts
" ============================================================================

" Move lines
nmap <C-Down> :<C-u>move .+1<CR>
nmap <C-Up> :<C-u>move .-2<CR>

imap <C-Down> <C-o>:<C-u>move .+1<CR>
imap <C-Up> <C-o>:<C-u>move .-2<CR>

vmap <C-Down> :move '>+1<CR>gv
vmap <C-Up> :move '<-2<CR>gv

" Toggle line number
nmap <C-F12> :set nu!<CR>
imap <C-F12> <C-o>:set nu!<CR>

" Toggle spell check
" For VIM7 only
nmap <C-F11> :setlocal spell!<CR>
imap <C-F11> <C-o>:setlocal spell!<CR>

"=============================================================================
" Modes
"=============================================================================

function EnglishMode()
    set imactivatekey=
    set noimcmdline
    set iminsert=0
    set imsearch=0
    setlocal spell
endfunction
command -nargs=0 EnglishMode call EnglishMode()

function ChineseMode()
    set imactivatekey=C-space
    set noimcmdline
    set iminsert=2
    set imsearch=2
    setlocal nospell
endfunction
command -nargs=0 ChineseMode call ChineseMode()

function TextMode()
    setlocal nocin
    setlocal nosm
    setlocal noai
    setlocal tw=78
endfunction
command -nargs=0 TextMode call TextMode()

function CodeMode()
    setlocal cin
    setlocal sm
    setlocal ai
    setlocal tw=78
endfunction
command -nargs=0 CodeMode call CodeMode()

function MailMode()
    call TextMode()
    setlocal ft=mail
    setlocal tw=70
endfunction
command -nargs=0 MailMode call MailMode()

function BBSMode()
    call MailMode()
    call ChineseMode()
    setlocal ft=bbs
    setlocal fenc=cp936
    setlocal tw=78
endfunction
command -nargs=0 BBSMode call BBSMode()

function VikiMode()
    call ChineseMode()
    setlocal ft=viki
    setlocal fenc=cp936
endfunction
command -nargs=0 VikiMode call VikiMode()

"=============================================================================
" Functions
"=============================================================================

"function TimeStamp()
"    let curposn= SaveWinPosn()
"    %s/\$Date: 2008-06-17 13:48:42$")/ge
"    %s/Last Change: 2008-06-17 13:48:42
"    %s/Last Modified: 2008-06-17 13:48:42
"    " Replace once and never update.
"    %s/Created: *$/\=strftime("Created: %Y-%m-%d %H:%M:%S")/ge
"    call RestoreWinPosn(curposn)
"endfunction
"command -nargs=0 TimeStamp call TimeStamp()

"function AutoTimeStamp()
"    augr tagdate
"    au!
"    au BufWritePre,FileWritePre * call TimeStamp()
"    augr END
"endfunction
"command -nargs=0 AutoTimeStamp call AutoTimeStamp()

"function NoAutoTimeStamp()
"    augr tagdate
"    au!
"    augr END
"endfunction
"command -nargs=0 NoAutoTimeStamp call NoAutoTimeStamp()

"command -nargs=1 Margin exec "match Error /.\\%>" . (<args> + 1) . "v/"
"command -nargs=0 NoMargin match none

"call AutoTimeStamp()

function CodeLayout()
    call CodeMode()
    WManager
    Tlist
endfunction
command -nargs=0 CodeLayout call CodeLayout()

" ============================================================================
" Plugins settings
" ============================================================================

" Sketch
command -nargs=0 ToggleSketch call ToggleSketch()

" NERDTree
nmap wm :NERDTree<cr>
"nmap wm :NERDTree<cr>:Tlist<cr>

" Winmanager
let g:winManagerWindowLayout = "FileExplorer"
"let g:winManagerWindowLayout = "FileExplorer|TagList"
"let g:winManagerWindowLayout = "TagList|FileExplorer"
"let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'
let g:winManagerWidth = 35

" 先在左侧打开WManager，再在右侧打开Tlist
"nmap wm :WManager<cr>:Tlist<cr>
"nmap wm :WMToggle<cr>

" Tlist
let Tlist_Use_Right_Window=1
"let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" minibufexpl
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplTabWrap = 1
"let g:miniBufExplorerMoreThanOne = 0

" A
let g:alternateNoDefaultAlternate=1

" LateXSuite
set grepprg=grep\ -nH\ $*

" Viki
let g:vikiNameSuffix=".viki"
autocmd! BufRead,BufNewFile *.viki
            \  set fenc=cp936
            \| set ft=viki
            \| call ChineseMode()

" BBS
autocmd! BufRead,BufNewFile *.bbs call BBSMode()

" Mail
autocmd! FileType mail call TextMode() | setlocal tw=70

" FencView
let g:fencview_autodetect=0

"=============================================================================
" Platform dependent settings
"=============================================================================

if (has("win32"))

    "-------------------------------------------------------------------------
    " Win32
    "-------------------------------------------------------------------------

    if (has("gui_running"))
        set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI
        set guifontwide=NSimSun:h9:cGB2312
    endif

    " For LaTeX Suite
    let g:Tex_CompileRule_dvi="latex -src-specials -interaction=nonstopmode $*"
    set shellslash

    " For Viki
    let g:netrw_browsex_viewer="start"

    " For tee
    set shellpipe=2>&1\|\ tee

    " VimTweak
    if (has("gui_running"))
        command -nargs=1 SetAlpha call libcallnr("vimtweak.dll",
            \"SetAlpha", <args>)
        command -nargs=0 TopMost call libcallnr("vimtweak.dll",
            \"EnableTopMost", 1)
        command -nargs=0 NoTopMost call libcallnr("vimtweak.dll",
            \"EnableTopMost", 0)
    endif

else

    "-------------------------------------------------------------------------
    " Linux
    "-------------------------------------------------------------------------

    let g:Tex_CompileRule_dvi
        \="latex -src-specials -interaction=nonstopmode $*"
    let g:Tex_ViewRule_dvi
        \="xdvi -editor 'gvim --servername latex-suite --remote-silent'"

    if (has("gui_running"))
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
    endif

    " For Viki
    let g:vikiHomePage="~/document/Viki/index.viki"
    let g:netrw_browsex_viewer="kfmclient exec"

    " make by scige
    set makeprg=make

endif
