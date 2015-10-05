set nocompatible " Required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself.
Plugin 'gmarik/Vundle.vim'

" Plugins ===================================
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'ervandew/supertab.git'
Plugin 'Raimondi/delimitMate.git'
Plugin 'fatih/vim-go.git'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'moll/vim-bbye.git'
Plugin 'rust-lang/rust.vim.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'bling/vim-airline.git'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
filetype plugin indent on    " required


" Settings ====================================
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start
"set colorcolumn=80 " 80 width guideline
set cursorline cursorcolumn " Highlight current line, and column
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes only)
set encoding=utf-8 nobomb
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Cap folding nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=1 " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 "Always show status line
set lazyredraw " Don't redraw when we don't have to
set magic " Enable extended regexes
set mouse+=a " Enable mouse in all modes
set nojoinspaces " Only insert single space after a '.', '?', and '!' witha join command
set nostartofline " Don't reset the cursor to the start of the line when moving around
set noswapfile " Do not use swap files
set nowrap " Do not wrap lines
set number " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
set report=0 " Show all changes
set ruler " Enable coordinates in bottom right
set scrolloff=3 " Start scrolling 3 lines from window border
set shiftwidth=2 " Indintation
set smartcase " Ignore ignorecase if search contains uppercase
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set tabstop=2 " Hitting <Tab> will produce 2 spaces
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set ttymouse=xterm " Set mouse type to xterm
set undofile " Persistent Undo
set viminfo=%,'9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file


colorscheme atom

let mapleader = ","


" Config ====================================
" Local directories
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" FastEscape 
" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Toggle show tabs and trailing spaces (,c) 
set lcs=tab:»·,trail:·,eol:¬,nbsp:_,extends:>,precedes:<
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" comma period opens silver searcher
noremap <Leader>. :Ag<Space>

" period period runs JSHint
noremap <Leader>j :JSHint<CR>

map <C-n> :NERDTreeToggle<CR>

" CTRL-P
let g:ctrlp_map = '<leader>,'
let g:ctrlp_command = 'CtrlP'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](.git|.svn|vendor|node_modules)'
      \ }

" Change shape of cursor in different modes
" OSX ---
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical line in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  else
    " tmux on OSX ---
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  endif
endif


" move between buffers in a window
map <leader>m :bnext<CR>
map <leader>n :bprevious<CR>

" close pane
map <leader>x :x<CR>

" close current buffer without closing window
noremap <leader>w :Bdelete<CR>

" open new empty buffer in current window
map <leader>b :ene<CR>

" Move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

if &term =~ '^screen'
  set ttymouse=xterm2
endif

" powerline stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='behelit'


noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let NERDTreeShowHidden=1

set runtimepath+=~/.vim/bundle/jshint2.vim/

syntax on
