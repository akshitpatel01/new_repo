syntax on
set exrc
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nohlsearch
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hidden
set scrolloff=8
set signcolumn=yes

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_device_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --execlude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>= :wincmd =<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>sv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>sh :sp<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>sp :Rg<space>
nnoremap <leader>sf :BLines<space>
nnoremap <leader>sb :Lines<space>
nnoremap <silent> <Leader>v+ :vertical resize +15<CR>
nnoremap <silent> <Leader>v- :vertical resize -15<CR>
nnoremap <silent> <Leader>h+ :5 wincmd+<CR>
nnoremap <silent> <Leader>h- :5 wincmd-<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter Fixit<CR>


noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

noremap <leader>gs :G<CR>
noremap <leader>gh :diffget //3<CR>
noremap <leader>gu :diffget //2<CR>

nnoremap <leader>le :call flake8#Flake8ShowError()<cr>



autocmd BufWritePost *.py call flake8#Flake8()
