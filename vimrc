"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                   "
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                   "
"               ██║   ██║██║██╔████╔██║██████╔╝██║                        "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                        "
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                   "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                   "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Lucas Gouveia Belon, a brazilian guy.
" This file is a bunch of pieces tied together

let $RTP=split(&runtimepath, ',')[0]
" Force the rc path to my vimrc
let $RC="$HOME/.vim/vimrc"

syntax on           " Enable syntax processing
" syntax enable     " Turn the syntax to the standard?

filetype plugin indent on " Filetype detection + Filetype plugin + Filetype indent 

if has('mouse')
    set mouse=a     " Enable mouse if available
endif

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

set laststatus=2    " Sets a permanent info line at the bottom of the screen.
set statusline=[%<%f\]                     " Filename
set statusline+=%w%h%m%r                   " Options
set statusline+=\ [%{getcwd()}]            " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ (%p%%)  " Right aligned file nav info

set backspace=start,eol,indent " If the backspace key doesn't work it will fix it

set number          " Show line numbers
set nocompatible    " Vim is not locked on vi standards, so we break compatibility
set hidden          " Enables switching buffers without saving then 
set autowrite       " Makes :wnext become :next

set ignorecase      " Will ignore case sensitive on searches
set smartcase		" Works with upper and lowercase
set showmatch		" Highlight matching ([{ }])
set hlsearch		" Highlight matches
set incsearch		" Search as characters are entered


set foldenable		" Enable folding
"set foldmethod=indent	" Fold based on indent level
" Other acceptable values are: marker, manual, expr, syntax, diff, instead of indent.
set foldlevelstart=10	" Open most folds by default
"set foldnestmax=10 	" 10 nested fold max
" this one above makes it impossible to nest over 10 times.

set history=200	" Set the history for our commands to 200 lines (default is 20)

set showcmd		" Show command in bottom bar
set wildmenu            " Enable auto completion menu after pressing TAB.
set lazyredraw		" Redraw only when we need to
set noerrorbells	" Makes the vim silent

"set tabstop=4		" Number of visual spaces per TAB
"set softtabstop=4	" Number of spaces in tab when editting (erasing)
"set shiftwidth=4	" Number of spaces when TAB
"set expandtab		" Tabs are turned to spaces
"
set smartindent		" Does the indentation correctly


set noswapfile		" Ensures that there will not be a .swp files, they're not good
"set nobackup		" We'll use the backup dir
set backupdir=~/.vim/backup " Enables a standard directory to swp files
set undodir=~/.vim/undodir  " We'll use undodir
set undofile		" There will be a undofile in our undodir

set path+=** " Adds all subdirectories 
set omnifunc=syntaxcomplete#Complete " Enable OmniComplete to all files

"set cursorline		" Highlight current line
"set cursorcolumn	" Highlight current column
"set ruler           " Sets more info about the file.
highlight colorcolumn ctermfg=cyan ctermbg=darkgray
"set colorcolumn=40
" Sets the color of colorcolumn

colorscheme koehler " a builtin colorscheme
 
" Other options: (I did :colorscheme then Ctrl+D)
"blue       desert     koehler    peachpuff  torte
"darkblue   elflord    morning    ron        zellner
"default    evening    murphy     shine
"delek      industry   pablo      slate


"FORÇAR MKSESSION A SALVAR EM CAMINHO RELATIVO
function! MakeSession() 
    let cwd = getcwd()
    let filename = cwd . '/.vim'
    exe "mksession! " . filename
    exe "tabedit! " . filename
    exe "silent g:^cd :d"
    exe "silent g:^lcd :d"
    exe "silent %s?\\v \\~=/.+/? ?g"
    exe "x"
endfunction

nnoremap <leader>mks :call MakeSession()<cr>

