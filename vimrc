set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

set nocompatible
set modelines=0
set shortmess+=I
set shell=/bin/zsh
set shellcmdflag=-ic

" Pathogen.
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Display options.
syntax on
set background=dark
colorscheme neverland
set guifont=Menlo:h11

" Tab options.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Line display and wrapping.
set wrap
set textwidth=80
set formatoptions=qrn1
" set colorcolumn=80
set number

" Sanification.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set mouse=a
set autoread
" set relativenumber
" set undofile

" Finding/moving improvements.
nnoremap / /\v
vnoremap / /\v
set gdefault
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<CR>
nnoremap <tab> %
vnoremap <tab> %

vnoremap <leader>r "hy:.,$s/<C-r>h//gc<left><left><left>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Key remappings.
nnoremap j gj
nnoremap k gk
nnoremap ; :

inoremap jj <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree.
set splitright
nnoremap <leader>d :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

au FocusLost * :wa
