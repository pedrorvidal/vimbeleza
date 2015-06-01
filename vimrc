set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Vim Airline - Status Bar legal
Plugin 'bling/vim-airline'

" Vim Colorschemes
Plugin 'flazz/vim-colorschemes'

" Vim CtrlP
Plugin 'kien/ctrlp.vim'

" Vim Emmet
Plugin 'mattn/emmet-vim'

" Vim MatchIt
Plugin 'pedrorvidal/matchit'

" Vim Surround
Plugin 'tpope/vim-surround'

" Vim Syntastic
Plugin 'scrooloose/syntastic'

" Vim TComment
Plugin 'tomtom/tcomment_vim'

" Vim UltiSnips
Plugin 'SirVer/ultisnips'

" Vim EasyMotion
Plugin 'Lokaltog/vim-easymotion'

" Vim JSON
Plugin 'leshill/vim-json'

" Vim Autoclose
Plugin 'Townk/vim-autoclose'

" Vim Tagbar
Plugin 'majutsushi/tagbar'

" Vim tabularize
Plugin 'godlygeek/tabular'

" Vim color highlight
" Plugin 'skammer/vim-css-color'
Plugin 'gorodinskiy/vim-coloresque'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" plugin from http://vim-scripts.org/vim/scripts.html


" ------------------- General Vim Confs -----------------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Open each new buffer in a new tab
" :au BufAdd,BufNewFile * nested tab sball

 " Basics {
     "set noexrc " don't use local version of .(g)vimrc, .exrc
     set cpoptions=aABceFsmq
     "             |||||||||
     "             ||||||||+-- When joining lines, leave the cursor
     "             |||||||      between joined lines
     "             |||||||+-- When a new match is created (showmatch)
     "             ||||||      pause for .5
     "             ||||||+-- Set buffer options when entering the
     "             |||||      buffer
     "             |||||+-- :write command updates current file name
     "             ||||+-- Automatically add <CR> to the last line
     "             |||      when using :@r
     "             |||+-- Searching continues at the end of the match
     "             ||      at the cursor position
     "             ||+-- A backslash has no special meaning in mappings
     "             |+-- :write updates alternative file name
     "             +-- :read updates alternative file name
     syntax on " syntax highlighting on
 " }

 " General {
     if has("autocmd")
         filetype plugin indent on " load filetype plugins/indent settings
     endif
     autocmd FileType php set smartindent
     set smartindent
     set autoindent
     set autochdir " always switch to the current file directory
     set backspace=indent,eol,start " make backspace a more flexible
     "set backup " make backup files
     set nobackup
     set noswapfile
     set nowritebackup
     "set backupdir=~/.vim/backup " where to put backup files
     set clipboard+=unnamed " share windows clipboard
     "set directory=~/.vim/tmp " directory to place swap files in
     set fileformats=unix,dos,mac " support all three, in this order
     set hidden " you can change buffers without saving
     " (XXX: #VIM/tpope warns the line below could break things)
     " set iskeyword+=_,$,@,%,# " none of these are word dividers
     set mouse=a " use mouse everywhere
     set noerrorbells " don't make noise
     set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
     "             | | | | | | | | |
     "             | | | | | | | | +-- "]" Insert and Replace
     "             | | | | | | | +-- "[" Insert and Replace
     "             | | | | | | +-- "~" Normal
     "             | | | | | +-- <Right> Normal and Visual
     "             | | | | +-- <Left> Normal and Visual
     "             | | | +-- "l" Normal and Visual (not recommended)
     "             | | +-- "h" Normal and Visual (not recommended)
     "             | +-- <Space> Normal and Visual
     "             +-- <BS> Normal and Visual

     set wildmenu " turn on command line completion wild style
     " ignore these list file extensions
     set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
     set wildmode=list:longest " turn on wild mode huge list
 " }
" GUI Settings {
 if has("gui_running")
     " Basics {
         colorscheme molokai " my color scheme (only works in GUI)
         set columns=180 " perfect size for me
         " set guifont=Monaco:h10 " My favorite font
         " set guifont=Monaco\ 9 " My favorite font
         set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
         " set guifont=Sauce\ Code\ Powerline\ Regular\ 10

        if has("win32")
            " WINDOWS
            set guifont="Ubuntu Mono derivative Powerline":h14
        endif
        if has("unix")
            if system('uname')=~'Darwin'
                " MAC
                set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
            else
                " LINUX
                set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
            endif
        endif
         "set guioptions=ce 
         "              ||
         "              |+-- use simple dialogs rather than pop-ups
         "              +  use GUI tabs, not console style tabs
         set lines=55 " perfect size for me
         set mousehide " hide the mouse cursor when typing
     " }

     " Font Switching Binds {
         "map <F8> <ESC>:set guifont=Consolas:h8<CR>
         "map <F9> <ESC>:set guifont=Consolas:h10<CR>
         " map <F10> <ESC>:set guifont=Monaco\ 9<CR>
         " map <F11> <ESC>:set guifont=Consolas\ 10<CR>
         "map <F12> <ESC>:set guifont=Consolas:h20<CR>
     " }
 endif
 " }


" ----------- AIRLINE STUFF --------------
" Airline Init() {
function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode',' ', 'branch'])
	let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
	let g:airline_section_c = airline#section#create(['filetype'])
	let g:airline_section_x = airline#section#create(['%P'])
	let g:airline_section_y = airline#section#create(['%B'])
	let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirlineInit()
" } Airline-close
set t_Co=256
let g:airline_powerline_fonts=1

" --------------- END AIRLINE STUFF -------------
let g:cssColorVimDoNotMessMyUpdatetime = 1
" --------------- TAGBAR ------------------------
nmap <F8> :TagbarToggle<CR>
" --------------- END TAGBAR STUFF -------------

" ---------------- EMMET -----------------------
"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>
"Change zen coding plugin expansion key to shift + e
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_expandword_key = '<C-y>;'
" let g:emmet_wrap_with_abbreviation_key = 'v_<C-y>f'

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>


 " Vim UI {
     "set cursorcolumn " highlight the current column
     set cursorline " highlight current line
     set incsearch " BUT do highlight as you type you
                    " search phrase
     set laststatus=2 " always show the status line
     set lazyredraw " do not redraw while running macros
     set linespace=0 " don't insert any extra pixel lines
                      " betweens rows
     " set list " we do what to show tabs, to ensure we get them
               " out of my files
     " set listchars=tab:>-,trail:- " show tabs and trailing
     set matchtime=5 " how many tenths of a second to blink
                      " matching brackets for
     set hlsearch " do not highlight searched for phrases
     set nostartofline " leave my cursor where it was
     set novisualbell " don't blink
     set number " turn on line numbers
     set numberwidth=5 " We are good up to 99999 lines
     set report=0 " tell us when anything is changed via :...
     set ruler " Always show current positions along the bottom
     set scrolloff=10 " Keep 10 lines (top/bottom) for scope
     set shortmess=aOstT " shortens messages to avoid
                          " 'press a key' prompt
     set showcmd " show the command being typed
     set showmatch " show matching brackets
     set sidescrolloff=10 " Keep 5 lines at the size
     " set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
     "              | | | | |  |   |      |  |     |    |
     "              | | | | |  |   |      |  |     |    + current
     "              | | | | |  |   |      |  |     |       column
     "              | | | | |  |   |      |  |     +-- current line
     "              | | | | |  |   |      |  +-- current % into file
     "              | | | | |  |   |      +-- current syntax in
     "              | | | | |  |   |          square brackets
     "              | | | | |  |   +-- current fileformat
     "              | | | | |  +-- number of lines
     "              | | | | +-- preview flag in square brackets
     "              | | | +-- help flag in square brackets
     "              | | +-- readonly flag in square brackets
     "              | +-- rodified flag in square brackets
     "              +-- full path to file in the buffer
 " }

 " Text Formatting/Layout {
     set completeopt= " don't use a pop up menu for completions
     set expandtab " no real tabs please!
     set formatoptions=rq " Automatically insert comment leader on return,
                           " and let gq format comments
     set ignorecase " case insensitive by default
     set infercase " case inferred by default
     set nowrap " do not wrap line
     set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
     set smartcase " if there are caps, go case-sensitive
     set shiftwidth=4 " auto-indent amount when using cindent,
                       " >>, << and stuff like that
     set softtabstop=4 " when hitting tab or backspace, how many spaces
                        "should a tab be (see expandtab)
     set tabstop=4 " real tabs should be 8, and they will show with
                    " set list on
 " }


" Easier window navigation
    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k
    nmap <C-l> <C-w>l


 " Folding {
     set foldenable " Turn on folding
     " set foldmarker={,} " Fold C style code (only use this as default
     "                     " if you use a high foldlevel)
     " set foldmethod=marker " Fold on the marker
     set foldlevel=100 " Don't autofold anything (but I can still
     "                   " fold manually)
     " set foldopen=block,hor,mark,percent,quickfix,tag " what movements
     "                                                   " open folds
     " function SimpleFoldText()  {"{
     "     return getline(v:foldstart).' '
     " endfunction " }
     " set foldtext=SimpleFoldText()  Custom fold text function"}
                                    " (cleaner than default)
 " }

"
" change the mapleader from \ to ,
let mapleader=","

"Map escape key to jj -- much faster
imap jj <esc>

"Saves time; maps the spacebar to colon
nmap <space> :

" Quickly edit/reload the vimrc file
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

"It clears the search buffer when you press ,/
nmap <silent> ,a :nohlsearch<CR>  

" Map MRU Plugin to F3
" map <F3> :MRU<CR>

"Better line wrapping
set wrap

set pastetoggle=<F11>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"set toggle wrap
:map <F4> :set nowrap! <CR>


" -------------------- NERDTREE  -------------
" Show hidden files in NerdTree
" let NERDTreeShowHidden=1
" Shortcut for NERDTreeToggle
" nmap <leader>nt :NERDTreeToggle <CR>
" map <F2> :NERDTreeToggle<CR>
" tab navigation like firefox
:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew :NERDTree<CR>
:imap <C-t> <Esc>:tabnew :NERDTree<CR>
"autopen NERDTree and focus cursor in new document
" autocmd VimEnter * NERDTree H:/
" autocmd VimEnter * wincmd p
"
" -------------- END NERDTREE --------

" -------------- EASY MOTION  --------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings
 " Bi-directional find motion
 " Jump to anywhere you want with minimal keystrokes, with just one key binding.
 " `s{char}{label}`
 nmap <Leader>f <Plug>(easymotion-s)
 " or
 " `s{char}{char}{label}`
 " Need one more keystroke, but on average, it may be more comfortable.
 " nmap <Leader>s <Plug>(easymotion-s2)
 
 " Turn on case insensitive feature
 let g:EasyMotion_smartcase = 1
 
 " JK motions: Line motions
 " map <Leader>j <Plug>(easymotion-j)
 " map <Leader>k <Plug>(easymotion-k)  


" -------------- END EASYMOTION ------------

" --------------- Editar vimrc em nova aba
nmap <leader>v :tabedit $MYVIMRC<CR>

"edit snippets in a new tab
noremap <leader>w :tab sp <bar> UltiSnipsEdit<CR>

" Alphabetically sort CSS properties in file with :SortCSS
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

"Split windows below the current window.
set splitbelow

" -------------- Para ler vimrc locais e setar diferentes colorschemes
if filereadable('.vimrc.local')
    source .vimrc.local
endif

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" vnoremap OO :Overline<CR>
" vnoremap OOU:Underline<CR>
" vnoremap DUN :DoubleUnderline<CR>
vnoremap OO :Strikethrough<CR>

" ----------------- Conf. CTRL P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

