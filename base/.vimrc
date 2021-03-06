execute pathogen#infect()
filetype plugin indent on

syntax on
set nowrap
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showmatch
set incsearch
set ignorecase
set smartcase
set ruler
set mouse=a
set hidden
set backspace=2
set showcmd
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set term=screen-256color
set clipboard=unnamedplus

if exists('+colorcolumn')
    set colorcolumn=80
endif

map <ESC>[8~    <End>
map <ESC>[7~    <Home>
imap <ESC>[8~    <End>
imap <ESC>[7~    <Home>

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256_dark'

let mapleader = ","
map <Leader>n :NERDTreeToggle<CR>
map <Leader>q :QTInit<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

augroup filetypedetect
    autocmd BufNewFile,BufRead *.genshi setfiletype textgenshi
augroup END
