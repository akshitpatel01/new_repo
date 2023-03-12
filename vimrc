syntax on                                                                          
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
                                                                                   
set colorcolumn=80                                                                 
highlight ColorColumn ctermbg=0 guibg=lightgrey                                    
                                                                                   
                                                                                   
let mapleader = " "                                                                
                                                                                   
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
                                                                                
" cscope                                                                        
set cscopequickfix=s-,c-,d-,i-,t-,e-                                            
nnoremap <leader>fc :call Csc("")<CR>                                           
nnoremap <leader>Fc :call Csc(input('Enter text: '))<CR>                        
nnoremap <leader>gd :call Csd("")<CR>                                           
nnoremap <leader>Gd :call Csd(input('Enter text: '))<CR>                        
nnoremap <leader>fs :call Css("")<CR>                                           
nnoremap <leader>Fs :call Css(input('Enter text: '))<CR>                        
nnoremap <leader>ft :call Cst("")<CR>                                           
nnoremap <leader>Ft :call Cst(input('Enter text: '))<CR>                        
nnoremap <leader>ff :call Csfd("")<CR>                                          
nnoremap <leader>Ff :call Csfd(input('Enter text: '))<CR>                       
nnoremap <leader>fo :call Csof(input('Enter text: '))<CR>                       
                                                                                
nnoremap <leader>tfc :call TCsc("")<CR>                                         
nnoremap <leader>tFc :call TCsc(input('Enter text: '))<CR>                      
nnoremap <leader>tgd :call TCsd("")<CR>                                         
nnoremap <leader>tGd :call TCsd(input('Enter text: '))<CR>                      
nnoremap <leader>tfs :call TCss("")<CR>                                         
nnoremap <leader>tFs :call TCss(input('Enter text: '))<CR>                      
nnoremap <leader>tft :call TCst("")<CR>                                         
nnoremap <leader>tFt :call TCst(input('Enter text: '))<CR>                      
nnoremap <leader>tff :call TCsfd("")<CR>                                        
nnoremap <leader>tFf :call TCsfd(input('Enter text: '))<CR>                     
nnoremap <leader>tfo :call TCsof(input('Enter text: '))<CR>                     
nnoremap <leader>br :silent !cscope -Rb<CR>      

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
