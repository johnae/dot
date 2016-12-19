let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'
if &compatible
  set nocompatible
endif
set shell=zsh
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('leafo/moonscript-vim')
call dein#add('cespare/vim-toml')
call dein#add('Matt-Deacalion/vim-systemd-syntax')
call dein#add('othree/html5.vim')
call dein#add('frankier/neovim-colors-solarized-truecolor-only')
call dein#add('ervandew/supertab')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('junegunn/fzf', { 'build': './install --bin', 'merged': 0 }) 
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

call dein#end()

" show line numbers
set number
" show matching paren
set showmatch
" hightlight current line
set cursorline
" Ignore case when searching
set ignorecase
" Be a little smarter about cases when searching 
set smartcase
" Don't reset cursor to start of line when moving around
set nostartofline
" Show the cursor position
set ruler
" Don't show into message
set shortmess=atI
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Enable crosshairs
set cursorline
set cursorcolumn

" Turn on wild menu for better command completion
set wildmenu

let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" don't wrap lines
set nowrap
set backspace=indent,eol,start
set copyindent
set hlsearch
set incsearch

set history=1000
set undolevels=1000

set nobackup
set noswapfile
set nowb

nnoremap <esc> :noh<return><esc>

nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

set background=dark
syntax on
scriptencoding utf-8
set encoding=utf-8
set virtualedit=onemore

no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

set expandtab     " Use spaces instead of tabs
set smarttab      " Be smart when using tabs ;)<Paste>
set shiftwidth=2  " Setup default ts
set tabstop=2
set softtabstop=2
set lbr           " Linebreak on 500 characters
set tw=500
set ai            " Auto indent
set si            " Smart indent
set wrap          " Wrap lines
set mouse=nicr    " Remove ME

" Home row jump to start and end of line
noremap H ^
noremap L $

filetype plugin indent on
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype rspec setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType mail setlocal fo+=aw

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

" fzf
nmap <c-p> :Files<return>

set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
if has("autocmd") && exists("+omnifunc") 
autocmd Filetype * 
\	if &omnifunc == "" | 
\	setlocal omnifunc=syntaxcomplete#Complete | 
\	endif 
endif 


let g:deocomplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
set completeopt=longest,menuone,preview
let g:deocomplete#enable_smart_case = 1
let g:deoplete#enable_at_startup = 1
let g:deopletee#omni#functions = {}
" let g:deopletee#omni#functions.moon = []
let g:deopletee#omni#functions.moon = []
let g:deopletee#omni#sources = {}
let g:deopletee#omni#sources.moon = ['buffer', 'file']
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType moon let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1

" augroup omnifuncs
"   autocmd!
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" augroup 
" 
" " deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

filetype plugin indent on
syntax enable

set termguicolors
set background=dark
colorscheme solarized
