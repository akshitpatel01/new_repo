" hi
set nocompatible
syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set wildmenu
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nohlsearch
set nowrap
set incsearch
set scrolloff=8
set ignorecase
set smartcase
set exrc
set laststatus=2
set linebreak

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


let mapleader = " "

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Windows
nnoremap <C-l> <C-W>l<CR>
nnoremap <C-k> <C-W>k<CR>
nnoremap <C-j> <C-W>j<CR>
nnoremap <C-h> <C-W>h<CR>
nnoremap <leader>sv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>sh :sp<bar> :Ex <bar> :vertical resize 30<CR>

" Tabs
nnoremap <S-l> gt
nnoremap <S-h> gT

" Buffer
noremap <leader>bs <C-^><cr>
noremap <leader>bd :bdelete
noremap <leader>ls :ls<CR>:b

" Marks
noremap <leader>ms :marks<cr>
noremap <leader>md :delm
noremap <leader>mda :delm!<cr>

" Insert mode
inoremap jk <ESC>
inoremap kj <ESC>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"

" cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nnoremap fc :call Csc("")<CR>
nnoremap Fc :call Csc(input('Enter text: '))<CR>
nnoremap gd :call Csd("")<CR>
nnoremap Gd :call Csd(input('Enter text: '))<CR>
nnoremap fs :call Css("")<CR>
nnoremap Fs :call Css(input('Enter text: '))<CR>
nnoremap ft :call Cst("")<CR>
nnoremap Ft :call Cst(input('Enter text: '))<CR>
nnoremap ff :call Csfd("")<CR>
nnoremap Ff :call Csfd(input('Enter text: '))<CR>
nnoremap fo :call Csof(input('Enter text: '))<CR>

nnoremap tfc :call TCsc("")<CR>
nnoremap tFc :call TCsc(input('Enter text: '))<CR>
nnoremap tgd :call TCsd("")<CR>
nnoremap tGd :call TCsd(input('Enter text: '))<CR>
nnoremap tfs :call TCss("")<CR>
nnoremap tFs :call TCss(input('Enter text: '))<CR>
nnoremap tft :call TCst("")<CR>
nnoremap tFt :call TCst(input('Enter text: '))<CR>
nnoremap tff :call TCsfd("")<CR>
nnoremap tFf :call TCsfd(input('Enter text: '))<CR>
nnoremap tfo :call TCsof(input('Enter text: '))<CR>
nnoremap crb :silent !cscope -Rb<CR>

function! Csc(msg)
    if len(a:msg) == 0
        cscope find c <cword>
    else
        exe "cscope find c " . a:msg
    endif
    copen
endfunction
function! TCsc(msg)
    set switchbuf+=usetab,newtab
    if len(a:msg) == 0
        tab cscope find c <cword>
    else
        exe "tab cscope find c " . a:msg
    endif
    copen
    set switchbuf-=usetab,newtab
endfunction

function! Csd(msg)
    if len(a:msg) == 0
        cscope find g <cword>
    else
        exe "cscope find g " . a:msg
    endif
endfunction
function! TCsd(msg)
    set switchbuf+=usetab,newtab
    if len(a:msg) == 0
        tab cscope find g <cword>
    else
        exe "tab cscope find g " . a:msg
    endif
    set switchbuf-=usetab,newtab
endfunction

function! Css(msg)
    if len(a:msg) == 0
        cscope find s <cword>
    else
        exe "cscope find s " . a:msg
    endif
    copen
endfunction
function! TCss(msg)
    set switchbuf+=usetab,newtab
    if len(a:msg) == 0
        tab cscope find s <cword>
    else
        exe "tab cscope find s " . a:msg
    endif
    copen
    set switchbuf-=usetab,newtab
endfunction

function! Cst(msg)
    if len(a:msg) == 0
        cscope find t <cword>
    else
        exe "cscope find t " . a:msg
    endif
    copen
endfunction
function! TCst(msg)
    set switchbuf+=usetab,newtab
    if len(a:msg) == 0
        tab cscope find t <cword>
    else
        exe "tab cscope find t " . a:msg
    endif
    copen
    set switchbuf-=usetab,newtab
endfunction

function! Testing()
    " this is the droid you're looking for
     "echo substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
     "return substitute(expand('<sfile>'), '.*\(\.\.\|\s\)', '', '')
    " compare with this (not what you want, just for reference)
     "echo expand('<sfile>')
endfunction
fun! ShowFuncName()
  let lnum = line(".")
    let col = col(".")
      echohl ModeMsg
        echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
          echohl None
            call search("\\%" . lnum . "l" . "\\%" . col . "c")
            endfun

function! Csfd(msg)
    if len(a:msg) == 0
        cscope find d <cword>
    else
        exe "cscope find d " . a:msg
    copen
    endif
endfunction
function! TCsfd(msg)
    set switchbuf+=usetab,newtab
    if len(a:msg) == 0
        tab cscope find d <cword>
    else
        exe "tab cscope find d " . a:msg
    copen
    endif
    set switchbuf-=usetab,newtab
endfunction

function! Csof(msg)
    if len(a:msg) == 0
        cscope find f <cword>
    else
        exe "cscope find f " . a:msg
    endif
endfunction
function! TCsof(msg)
    set switchbuf+=usetab,newtab
    if len(a:msg) == 0
        tab cscope find f <cword>
    else
        exe "tab cscope find f " . a:msg
    endif
    set switchbuf-=usetab,newtab
endfunction

" quickfix
nnoremap <leader>qt :copen<CR>
nnoremap <leader>qc :ccl<CR>

" autocmd
" autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T

" hl search
nnoremap <ESC><ESC> :nohlsearch<CR>
