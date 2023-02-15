"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Lucas Gouveia Belon, a brazilian guy.
" This file is a bunch of pieces tied together

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"

syntax on           " Enable syntax processing
" syntax enable     " Turn the syntax to the standard?

filetype plugin indent on " Filetype detection + Filetype plugin + Filetype indent 

set omnifunc=syntaxcomplete#Complete " Enable OmniComplete to all files

set path+=** " Adds all subdirectories 

if has('mouse')
    set mouse=a     " Enable mouse if available
endif

set backspace=start,eol,indent " If the backspace key doesn't work it will fix it
set hidden          " Enables switching buffers without saving then 
set number          " Show line numbers
set nocp    		" Vim is not locked on vi standards, so we break compatibility
set ignorecase      " Will ignore case sensitive on searches
set smartcase       " Will help to ignore case sensitive
"set cursorline		" Highlight current line
"set cursorcolumn	" Highlight current column

set showmatch		" Highlight matching ([{ }])
set hlsearch		" Highlight matches
set incsearch		" Search as characters are entered

set autowrite       " Makes :wnext become :next
set smartindent     " Make indentation smarter

set foldenable		" Enable folding
set foldmethod=indent	" Fold based on indent level
" Other acceptable values are: marker, manual, expr, syntax, diff, instead of indent.

set foldlevelstart=10	" Open most folds by default
"set foldnestmax=10 	" 10 nested fold max
" this one above makes it impossible to nest over 10 times.

set history=200	" Set the history for our commands to 200 lines (default is 20)

set showcmd		    " Show command in bottom bar
set lazyredraw		" Redraw only when we need to
set noerrorbells	" Makes the vim silent
set tabstop=4		" Number of visual spaces per TAB
set softtabstop=4	" Number of spaces in tab when editting (erasing)
set shiftwidth=4	" Number of spaces when TAB
set expandtab		" Tabs are turned to spaces
set smartindent		" Does the indentation correctly
set smartcase		" Works with upper and lowercase
set noswapfile		" Ensures that there will not be a .swp files, they're not good
set nobackup		" We'll use the backup dir
set backupdir=~/.vim/backup " Enables a standard directory to swp files
set undodir=~/.vim/undodir  " We'll use undodir
set undofile		" There will be a undofile in our undodir
set wildmenu        " Enable auto completion menu after pressing TAB.

nnoremap <space> za 
" Space open/closes folds

nnoremap <leader><space> :nohlsearch<CR>	
" Turns '<\ + space>' a command to turn off the 
" syntax highlighting from previous search


"  SPLITTED WINDOWS MOVE SIMPLIFICATION
nnoremap .. :vertical resize -1<CR>
" Turns ,, and .. in vertical resize keys
nnoremap ,, :vertical resize +1<CR>

nnoremap ;; :resize +1<CR>
" Turns \\ and ;; into resize keys
nnoremap \\ :resize -1<CR>

" TABS BINDINGS ########

" \c stands for create tab
" (with no new Blank buffers)
nnoremap \c :tabnew %<CR>
" \x stands for exchange
nnoremap \x :tabnext<CR>
" \s is close to 
nnoremap \s :tabprevious<CR>
" \z stands for tab zipped
nnoremap \z :tabclose<CR>
" Move the tab to the right
nnoremap \. :tabmove +1<CR>
" \< is to move the tab to the left
nnoremap \, :tabmove -1<CR>
" \f stands for first tab
nnoremap \f :tabfirst<CR>
" \l stands for last tab
nnoremap \l :tablast<CR>

" ------------------------------------------------------------------------------------

" MACROS:

" This macro turn the change of the relative number easier
let @R=':set relativenumber!k'
" Pre-sets the @i macro to be a cool window, with a terminal at the bottom and
" a file tree at the left corner
let @I=':botright terminal:topleft vertical split:Explore:vertical resize 20:resize 30:mksession! Session.vim'
" This macro is for opening a terminal to run some fast applications
let @O=':belowright vertical terminalPS1="> "h'
" Pre-sets the @h macro to be a html file initializer
let @H='i<!DOCTYPE html><html lang="pt-br"><head><title>TITLE</title><meta charset="utf-8"></head><body>BODY</body></html>gg'
" Pre-sets the @c macro to be a simple C program initializer
let @C = 'i/* */# include <stdio.h># include <stdlib.h>int main(void){return 0;}k$i'
let @A = ':belowright vertical split:bn:botright split:bn:belowright vertical split:bn:tabnew %:bn'

" colorscheme koehler " a builtin colorscheme
 
" Other options: (I did :colorscheme then Ctrl+D)
"blue       desert     koehler    peachpuff  torte
"darkblue   elflord    morning    ron        zellner
"default    evening    murphy     shine
"delek      industry   pablo      slate

