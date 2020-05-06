" Vimrc config file

set nocompatible              " be iMproved, required
"filetype off                  " required

"========== Plug plugin management ==========
" set the runtime path to include Vundle and initialize

" Let Vundle manage Vundle, required.
" All plugins must be between begin and end calls
call plug#begin()
Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
Plug 'elzr/vim-json'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/delimitMate.vim'
Plug 'dracula/vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plugin 'ryanoasis/vim-devicons'
call plug#end()

"Enable filetypes
"filetype plugin indent on    " required

"  Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"========= General Config ==========
syntax on
syntax enable

" Map escape to jj
imap jj <esc>

" Remap leader key
let mapleader=","

colorscheme dracula

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner
set ruler

"Reduce leader timeout
set timeoutlen=500

"Show hidden files in directory
set hidden

"Font size and type
set guifont=Hack:h10

"Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
set smarttab

"Show command button in bottom right portion of screen
set showcmd

" Show line numbers
set relativenumber
set number

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

set linespace=2

"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching
set incsearch

"Highlight searching
set hlsearch

"Hide MacVim toolbar by default
set go-=T

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

" For autocompletion
set wildmode=list:longest

"Fold enable
set foldenable

"Hide mouse when typing
set mousehide

"Shortcut to fold tags with leader
nnoremap <leader>ft Vatzf

" Saves time
nmap <space> :

" Shortcut for editing vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>

" Automatically change current directory to that of file in the buffer
autocmd BufEnter * cd %:p:h

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC


"========== Split control ==========
" Removes pipe that acts as separator on splits
set fillchars+=vert:\ 

" Sets the direction of the new split
set splitbelow splitright

" Opens a split and switches to new split
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


"========== General navigation ==========
" Auto center on move
nmap G Gzz
nmap j jzz
nmap k kzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz


"========== General Editing ==========
" TODO: Move line up or down taking indent level of surrounding lines (currently conflicts w/ split nav)
"nmap <C-j> ddp==
"nmap <C-k> ddkP==


"========== NERDTreeToggle ==========
nmap <leader>nt :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
"let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

