set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Let Vundle manage Vundle, required.
" All plugins must be between begin and end calls
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'elzr/vim-json'
call vundle#end()

filetype plugin indent on    " required

"  Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


syntax on

set ruler

set timeoutlen=500

set hidden

set guifont=Hack:h10

nmap <C-j> ddp==
nmap <C-k> ddkP==

" Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

set showcmd

set number
set relativenumber

set smartindent
set autoindent

set laststatus=2
set linespace=2

set wrap
set textwidth=79
set formatoptions=qrn1

set incsearch

set splitbelow
set hlsearch

nnoremap <leader>q gqip

set wildmode=list:longest

set foldenable

nnoremap <leader>ft Vatzf


nmap ,ev :tabedit $MYVIMRC<cr>

nmap <space> :

imap jj <esc>

autocmd bufwritepost .vimrc source $MYVIMRC

autocmd BufEnter * cd %:p:h

nmap ,nt :NERDTreeToggle<cr>
