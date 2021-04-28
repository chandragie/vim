"installed plugin
call plug#begin('$HOME/.vim/plugged')
"colorscheme gruvbox
Plug 'gruvbox-community/gruvbox'

"is a great Vue.js syntax highlighter. It allows Vim to correctly highlight
"single file components. The HTML, JavaScript and CSS all get the correct
"syntax.
Plug 'posva/vim-vue'

Plug 'junegunn/fzf', {'dir':'~/.fzf', 'do':'./install -all'}
Plug 'junegunn/fzf.vim'

"This is a fuzzy searcher for lines rather than filenames. It's faster than
"any other multi-file line searching I have seen in any other IDE. My setup is
"to type ':Ag' in Vim to get the search prompt. From there I start typing a
"variable name or value and I almost instantly get a result of all the lines
"in all the files that contain a match to my inpute. The search is done
"recursivly on the current directory. This is the fastest way to find text in
"multiple files.
Plug 'mileszs/ack.vim'

Plug 'scrooloose/nerdtree'

"lints my code as I type. The best thing about it is it automatically detects
"ESlint files in the parent directory and uses those to lint the code. So if I
"have my ESlint file set to allow only single quote text, I get a lint warning
"if I try to use a double quote in my JavaScript. This plugin works great with
"my Vue plugins to only warn me about the JavaScript in my single file
"components, and not to try to lint my HTML or CSS using JavaScript rules.
Plug 'w0rp/ale'

Plug 'Valloric/YouCompleteMe'

"is simple and great for anyone who ever works with CSS. Whenever it detects a
"CSS color, it changes the background of that text to match the CSS color.
Plug 'ap/vim-css-color'

"is a TypeScript syntax plugin.
Plug 'leafgarland/typescript-vim'

"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'scrooloose/nerdcommenter'

Plug 'jremmen/vim-ripgrep'

Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'

Plug 'git@github.com:kien/ctrlp.vim.git'
call plug#end()

"====================================
"specific plugins configuration
"====================================

"fzf config
" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

"rg config
if executable('rg')
    let g:rg_derive_root='true'
endif

"ctrlp config
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"====================================
"specific vim config
"====================================

"set leaderkey
let mapleader=" "

"use system clipboard (need to install unnamedplus or similar services)
"set clipboard+=unnamedplus
syntax on

set relativenumber
set nu
"no highlight search
set nohlsearch
"incremental search
set incsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set scrolloff=8
set signcolumn=yes
"enable this to set colorscheme
set termguicolors
"set ignore case
set ignorecase

set undodir=$HOME\.vim\undodir
set undofile

"set to maximized
"simalt does not work on my machine, so I had to find workaround!
"autocmd GUIEnter * simalt ~x
"au GUIEnter * simalt ~x
set lines=99
set columns=999
set ruler
set colorcolumn=175
"set cursor
"set cursorline
"set cursorcolumn
"highlight CursorLine ctermbg=0 guibg=#2b2b2b
"highlight CursorColumn ctermbg=0 guibg=#2b2b2b

"active colorscheme
colorscheme gruvbox
set background=dark

"====================================
"key bindings
"====================================

map <silent> <F3> :NERDTreeToggle<CR>
map <silent> <F2> :Files<CR>

"move between window
nnoremap <leader>j <C-w>j<C-w>_
nnoremap <leader>k <C-w>k<C-w>_
nnoremap <leader>h <C-w>h<C-w>_
nnoremap <leader>l <C-w>l<C-w>_

cnoremap <leader>j <C-w>j<C-w>_
cnoremap <leader>k <C-w>k<C-w>_
cnoremap <leader>h <C-w>h<C-w>_
cnoremap <leader>l <C-w>l<C-w>_

"move between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>


"make window wider
nnoremap <silent> <C-+> :vertical resize +5<CR>
nnoremap <silent> <C--> :vertical resize -5<CR>

"move cursor in input mode using hjkl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"show undotree
nnoremap <leader>u :UndotreeShow<CR>

"ctrl + f to search
nnoremap <C-f> /

"savings
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>

"exit insert mode with kj
inoremap kj <Esc><CR>

"quit
nnoremap <leader>q :q<CR>

"open terminal below
nnoremap <silent> <leader>` :below terminal<CR><C-w>w :resize 40<CR><C-w>w
inoremap <silent> <leader>` <Esc>:below terminal<CR><C-w>w :resize 40<CR><C-w>w


"YCM keybindings
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

"imap cll console.log()<Esc>==f(a

"javacomplete configuration
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"nnoremap <C-@> <Plug>(JavaComplete-Imports-AddSmart)
"inoremap <C-@> <Plug>(JavaComplete-Imports-AddSmart)



"====================================
"auto commands
"====================================

"remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


