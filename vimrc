
" Forget compatibility with Vi
set nocompatible

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner
set ruler

"Reduce leader timeout
set timeoutlen=500

"Show hidden files in directory
set hidden

"Color Scheme
colorscheme neonwave 

"Font size and type
set guifont=Hack:h10

"Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

"Show command button in bottom right portion of screen
set showcmd

" Show line numbers
set number
set relativenumber

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

set splitbelow

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

" Custom autocomplete dictionary
"set dictionary+=/Users/Home/.vim/dict.txt
"imap ,<tab><tab> <c-x><c-k>

"Opens a vertical split and switches over
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>l

" Shortcut for editing vimrc file
nmap ,ev :tabedit $MYVIMRC<cr>

" Change zen coding expand key to Control + e
let g:user_zen_expandabbr_key = '<C-e>'

" Saves time
nmap <space> :

" Automatically change current directory to that of file in the buffer
autocmd BufEnter * cd %:p:h

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC

" Map escape to jj
imap jj <esc>

" Map code completion to ,+tab
"imap ,<tab> <C-x><C-o>

" Shortcut for NERDTreeToggle
nmap ,nt :NERDTreeToggle<cr>

let NERDTreeShowHidden=1

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

"Autocompletion popup menu
"set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down" : ""<CR>'
