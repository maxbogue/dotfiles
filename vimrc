"
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
"

" Section: Key Mappings
"--------------------------------------------------------------------------

nnoremap <leader><space> :noh<CR>
nnoremap <tab> %
vnoremap <tab> %

" You don't know what you're missing if you don't use this.
nmap <C-e> :e#<CR>

vnoremap <leader>r "hy:.,$s/<C-r>h//gc<left><left><left>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Display options.
syntax on
colorscheme neverland
set guifont=Menlo:h11

" Section: Hacks
"--------------------------------------------------------------------------

" Move within wrapped lines using j and k
nnoremap j gj
nnoremap k gk

" Pretty much never want F1 to mean help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Easier pane movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Finding/moving improvements
nnoremap / /\v
vnoremap / /\v

" I always hit ":W" instead of ":w"
command! Q q
command! W w

" I don't use Ex mode
map Q <silent>
map q: <silent>
map K <silent>

" Section: Vim Options
"--------------------------------------------------------------------------

set autoindent              " Carry over indentation from previous line
set autoread                " Update the buffer when a file changes
set autowrite               " Write on :next/:prev/^Z
set backspace=indent,eol,start
                            " Make backspace work in more places
set encoding=utf-8          " Use UTF-8 by default
set expandtab               " Use soft tabs
set formatoptions=tcqn1     " t - autowrap normal text
                            " c - autowrap comments
                            " q - gq formats comments
                            " n - autowrap lists
                            " 1 - break _before_ single-letter words
set gdefault                " Search all lines by default
set hidden                  " Don't prompt to save hidden windows until exit
set hlsearch                " Highlight when searching
set ignorecase              " Make patterns case-insensitive
set incsearch               " Search as you type
set laststatus=2            " Always show the status bar
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«
                            " How to display invisible characters
set modelines=0
set mouse=a                 " Allow the mouse to be used in all modes
set nocompatible            " Don't try to be vi compatible
set nonumber                " Start without line numbers
set ruler                   " Set row/col and percentage
set scrolloff=5             " Keep cursor this many lines from top/bottom
set shiftwidth=4            " Number of spaces to shift for autoindent or >,<
set shortmess+=I            " No intro message
set showmatch               " Hilight matching braces/parens/etc.
set showmode                " Display the mode in the status bar
set smartcase               " Make patterns with caps case-sensitive
set softtabstop=4           " Make spaces feel like tabs
set splitbelow              " Horizontal split opens below
set splitright              " Vertical split opens to the right
set tabstop=4               " The One True Tab Width
set ttyfast                 " Better redrawing
set wildmenu                " Show possible completions on the command line
set wildmode=list:longest,full
                            " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules
                            " Ignore certain files in tab-completion

" Section: Plugin Configuration
"--------------------------------------------------------------------------

" Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" NERDTree
set splitright
nnoremap <leader>d :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\~$', '\.pyc$']
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" gitgutter
highlight clear SignColumn
