set nocompatible " use vim defaults
set scrolloff=3 " keep 3 lines when scrolling
set ai " set auto-indenting on for programming
set shiftwidth=4 " go for an indent of 4
set tabstop=4
set softtabstop=4

set showcmd " display incomplete commands
"set number " show line numbers
set ruler " show the current row and column
set wildmenu " Use the cool tab complete menu
set wildignore=*.o,*~ " ignore some

set wildchar=<Tab> wildmenu wildmode=full
"set wildmode=longest,list 
"set wildmode=longest:full,full

set hidden " be not so strikt when switching from a unsaved buffer
set tabpagemax=100 " increase tab limit

" set switchbuf=usetab,newtab,split " quickfix should jump to tab
"set switchbuf=useopen

set nobackup " do not keep a backup file
set nowritebackup
set autowrite
set directory=%HOME%\_vimswap

set hlsearch " highlight searches
set incsearch " do incremental searching
set showmatch " jump to matches when entering regexp
set ignorecase " ignore case when searching
set smartcase " no ignorecase if Uppercase char present
set showfulltag " show full tags when doing search completion

set backspace=indent,eol,start
" set backspace=indent,eol,start " make that backspace key work the way it should

set mouse=a
set shortmess+=I " hide welcome screen
set fillchars+=vert:\     " get rid of the pipe

"set visualbell t_vb= " turn off error beep/flash
"set novisualbell " turn off visual bell
set belloff=all

set expandtab
" set colorcolumn=120

syntax on " turn syntax highlighting on by default
filetype on " detect type of file
filetype indent on " load indent file for specific file type
filetype plugin on " load plugins for specific file type

set encoding=utf-8
"set fileencoding=utf-8
"set fileformat=unix
"set makeencoding=utf-8
scriptencoding utf-8 " nedds to be fater encoding=

"set listchars=tab:▸\ ,eol:¬ " Use custom symbols for tabstops and EOLs
set listchars=tab:→\ ,eol:¬
set showbreak=…\ 

if has("gui_running")
    set columns=120
    set lines=45
    set guioptions=Ac
    set guifont=Liberation_Mono:h10
    "set guifont=Source_Code_Pro_Medium:h10
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search

"if has("win32")
"    set grepprg=findstr\ /n\ /s\ $*\ \*
"endif

"if executable("ack")
"	set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=build
"endif

"if executable('ag')
"    let &grepprg='ag --nogroup --nocolor -i $*'
"    "set grepformat=%f:%l:%c:%m
"endif

if executable('grep')
    let &grepprg='grep -m 1000 -HUIrn --exclude=' . shellescape(&wildignore) . ' $* .'
endif

set path=*
"command -nargs=* -bar G :grep -E "<args>"
command -nargs=* G :call MyJump("<args>")

set makeprg=build

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" statusbar
set laststatus=2
set statusline=
"set statusline+=%-3.3n\                      " buffer number
set statusline+=\ %f                          " file name
set statusline+=%2*%{&modified?\"*\":\"\ \"}\ 
set statusline+=%{&readonly?\"ro\":\"\ \ \"}%* 
"set statusline+=                           "default coloring
set statusline+=%=                           " right align
set statusline+=%3*%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=\ %{&encoding}                " encoding
set statusline+=\ %{&fileformat}              " file format
set statusline+=\ \ \ \                            "default coloring
set statusline+=%*0x%-4B                      " current char
set statusline+=%.(%4l,%-6c%)%<%P        " offset

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlighting
exec "colorscheme" "msk"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings

"inoremap <S-CR> <Esc>

" movement
map <C-Tab>   :bp<CR>
map <C-S-Tab> :bp<CR>
map <A-n>     :cn<CR>
map <A-N>     :cp<CR>

" window navigation
noremap <M-Right> <C-w>l
noremap <M-Left>  <C-w>h
noremap <M-Up>    <C-w>k
noremap <M-Down>  <C-w>j

" paragraph navigation
map <C-Up> {
map <C-Down> }

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" custom jumps
map <A-1> :call MySwitch(0)<CR>
map <A-2> :call MySwitch(1)<CR>
map <silent> <A-`> :call MyWindow()<CR>

" load all
"map <C-F5> :n **/*.

nmap <silent> <F4> :call MyJump(expand("<cword>"))<CR>
nmap <silent> <F5> :call MyQuickfix()<CR>

map <F8> :make<CR>

nmap <F11> %!python -m json.tool
nmap <F12> :set list!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" functions

function! MyJump(string)
    if (strlen(a:string)) > 0
        let s:word = a:string
    else
        let s:word = expand("<cword>")
    endif
    "echo "Find " . s:word
    "let s:startTime = localtime()
    silent exe ':grep ' . s:word
    botright copen
    "let s:time = localtime() - s:startTime
    "echo "time: " . s:time
endfunction


function! MyWindow()
    let s:wincount = winnr('$')
    if s:wincount == 1
        vs
    else
        only
    endif
endfunction


function! MyQuickfix()
    "let s:lastbuf = winnr('#')
    "echo "count " s:wincount " last " s:lastbuf
    let s:list = getqflist({'winid' : 1})
    let s:fix = get(s:list, 'winid')
    if s:fix != 0
        let s:wincount = winnr('$')
        if s:wincount > 1
            cclose | wincmd p
        else
            "echo "no window"
        endif
    else
        botright copen 8
    endif
endfunction


function! MySwitch(other)
    let s:ext = tolower(expand("%:e"))
    let s:base = expand("%:t:r")
    if match(s:ext, 'cpp') == 0 || match(s:ext, 'c') == 0
        let s:flipname = s:base . ".h"
        let res = findfile(s:flipname, "*;")
        if empty(res)
            let s:flipname = s:base . ".hpp"
            let res = findfile(s:flipname, "*;")
        endif
        if !empty(res)
            if a:other == "1"
                wincmd w
            endif
            exec ":e " . res
        endif
    elseif match(s:ext, 'h') == 0 || match(s:ext, 'hpp') == 0
        let s:flipname = s:base . ".cpp"
        let res = findfile(s:flipname, "*;")
        if empty(res)
            let s:flipname = s:base . ".c"
            let res = findfile(s:flipname, "*;")
        endif

        if !empty(res)
            if a:other == "1"
                wincmd w
            endif
            exec ":e " . res
        endif
    else
        echo "no match"
    endif
endfunction



" function! InsertStatuslineColor(mode)
"   if a:mode == 'i'
"     hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
"   elseif a:mode == 'r'
"     hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
"   else
"     hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
"   endif
" endfunction
" 
" au InsertEnter * call InsertStatuslineColor(v:insertmode)
" au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

"command -nargs=* G :call MyJump("<args>")
"command -nargs=1 -complete=file -bar Test :rightbelow :split <args>
"command -nargs=1 -bar Test :grep /s /C:"<args>" .\* | botright copen 8

" The Silver Searcher
"if executable('ag')
"  " Use ag over grep
"  set grepprg=ag\ --nogroup\ --nocolor\ -0\ --cc\ --cpp\ --hh\ --make\ --python\ --cmake\ --batch
"
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
"  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"endif



"function! MyJump()
"    let s:word =expand("<cword>")
"    call setqflist([])
    "silent exe ':grep /s /C:"' . s:word . '" ' . getcwd() . '\*' | botright copen 8 | wincmd p
    "silent exe ':grep /s /C:"' . s:word . '" ' . getcwd() . '\*' | botright copen 8
    "silent exe ':grep ' . s:word . ' *'| botright copen 8
"    silent exe ':grep ' . s:word . ' *' | call DoAThing("asd")
"endfunction



"function! MyQuickfix()
"    for i in range(1, winnr('$'))
"        let bnum = winbufnr(i)
"        "echo "> " . bnum
"        if getbufvar(bnum, '&buftype') == 'quickfix'
"            cclose
"            return
"        endif
"    endfor
"    botright copen 8
"endfunction

"function! Switch_Here()
"  if match(expand("%"),'\.cpp') > 0
"    let s:flipname = substitute(expand("%"),'\.cpp\(.*\)','.h\1',"")
"    exe ":find " s:flipname
"  elseif match(expand("%"),"\\.h") > 0
"    let s:flipname = substitute(expand("%"),'\.h\(.*\)','.cpp\1',"")
"    exe ":find " s:flipname
"  endif
"endfun
"
"
"function! Switch_Other()
"  if match(expand("%"),'\.cpp') > 0
"    let s:flipname = substitute(expand("%"),'\.cpp\(.*\)','.h\1',"")
"    wincmd w
"    exe ":find " s:flipname
"  elseif match(expand("%"),"\\.h") > 0
"    let s:flipname = substitute(expand("%"),'\.h\(.*\)','.cpp\1',"")
"    wincmd w
"    exe ":find " s:flipname
"  endif
"endfun

"function! CocoaMondo_LoadFile(filename)
"  let s:bufname = bufname(a:filename)
"  if (strlen(s:bufname)) > 0
"    exe ":buffer" s:bufname
"  else
"    exe ":find " a:filename
"  endif
"endfun
"
