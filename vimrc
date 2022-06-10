" Vimrc config file

set nocompatible              " be iMproved, required


"========== Plug plugin management ==========
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/vim-plug'
Plugin 'scrooloose/nerdtree'
Plugin 'elzr/vim-json'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/delimitMate.vim'
Plugin 'dracula/vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plugin 'ryanoasis/vim-devicons'
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'rust-lang/rust.vim'
call vundle#end()


"========= General Config ==========
syntax on
syntax enable
filetype indent plugin on


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


"========== OmniSharp ==========
" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
set completeopt=longest,menuone,preview,popuphidden

" Highlight the completion documentation popup background/foreground the same as
" the completion menu itself, for better readability with highlighted
" documentation.
set completepopup=highlight:Pmenu,border:off


" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>















