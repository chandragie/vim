call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"Plugin configuration"
"===================================

"NERDTree config
" Open when no files were speficied on vim launch
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"fzf config
let g:fzf_layout = { 'down': '30%' }


"Specific VIM configuration
"===================================

let mapleader=" "
syntax on
set relativenumber
set nu
"set lines=99
"set columns=999
set ruler
set nohlsearch
" set colorcolumn=175
set incsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set scrolloff=8
set signcolumn=yes
set ignorecase
set cursorcolumn
set cursorline

set termguicolors
colorscheme gruvbox
set background=dark

set undodir=~\AppData\Local\nvim\undodir 
set undofile

"===================================
"key bindings
"===================================

"Open window plugin
nnoremap <leader>u :UndotreeShow<CR>
map <leader>e :NERDTreeToggle<CR>
map <leader>f :Files<CR>

"go to normal mode with kj 
inoremap kj <Esc>

"ctrl + / to comment
nmap <C-_> gcc
imap <C-_> <esc>gcc a

"savings
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>

"find in document
nnoremap <C-f> /

"move cursor in input mode using hjkl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"make window wider
nnoremap <silent> <C-]> :vertical resize +5<CR>
nnoremap <silent> <C-[> :vertical resize -5<CR>

"move between window
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-h> <C-w>h<C-w>_
nnoremap <C-l> <C-w>l<C-w>_

"move between tabs
nnoremap <S-l> :tabprevious<CR>
nnoremap <S-h> :tabnext<CR>

"make new tab
nnoremap <C-T> :vsplit<CR>

nnoremap <leader>% :source % <Enter>

"open terminal below
nnoremap <silent> <leader>` :terminal<CR>
inoremap <silent> <leader>` <Esc>:terminal<CR>

"quit
nnoremap <leader>q :q<CR>


"====================================
"auto commands
"====================================
au GUIEnter * simalt ~x
