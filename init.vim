call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

"Plugin configuration"
"===================================

"NERDTree config
" Open when no files were speficied on vim launch
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"fzf config
" let g:fzf_layout = { 'down': '30%' }
" ignore nodemodules
let $FZF_DEFAULT_COMMAND = 'ag -g ""' 
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

"COC configuration
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

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
nnoremap <C-u> :UndotreeShow<CR>
map <C-e> :NERDTreeToggle<CR>
" map <leader>f :Files<CR>

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

" use alt+hjkl to move between split/vsplit panels using Alt
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
 
"move between tabs
nnoremap <S-l> :tabprevious<CR>
nnoremap <S-h> :tabnext<CR>

"make new tab
nnoremap <C-T> :vsplit<CR>

nnoremap <leader>% :source % <Enter>

"open terminal below
" open new split panes to right and below
set splitright
set splitbelow
" " turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" " start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" " open terminal on ctrl+n
function! OpenTerminal()
    " use this for bash
    " split term://bash
    split term://powershell
    resize 10
endfunction
nnoremap <leader>` :call OpenTerminal()<CR>

"quit
nnoremap <leader>q :q<CR>


"====================================
"auto commands
"====================================
au GUIEnter * simalt ~x
