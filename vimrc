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
set encoding=utf-8

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
set scrolloff=5		" The cursor won't be able to reach the top nor the
			"bottom of the screen

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

set spelllang=pt_br,en
set spellfile=~/.vim/spell/pt_utf-8.add,~/.vim/en_utf8.add

"set cursorline		" Highlight current line
"set cursorcolumn	" Highlight current column
"set ruler		" Sets more info about the file.
highlight colorcolumn ctermfg=cyan ctermbg=darkgray
"set colorcolumn=40
" Sets the color of colorcolumn

colorscheme koehler " a builtin colorscheme
 
" Other options: (I did :colorscheme then Ctrl+D)
"blue       desert     koehler    peachpuff  torte
"darkblue   elflord    morning    ron        zellner
"default    evening    murphy     shine
"delek      industry   pablo      slate


"FORCAR MKSESSION A SALVAR EM CAMINHO RELATIVO
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

" KEY BINDINGS
"nnoremap <space> za 
" Space open/closes folds

nnoremap <leader>e :Lexplore<CR>
" Abre ou fecha o navegador de arquivos com \e

"nnoremap <leader><space> :nohlsearch<CR>	
nnoremap <space><space> :nohlsearch<CR>	
" Turns '<\ + space>' a command to turn off the 
" syntax highlighting from previous search

nnoremap <space>n :cnext<CR>
nnoremap <space>p :cprevious<CR>

" BufferNavigation
nnoremap <leader>n :bNext<CR>
nnoremap <leader>p :bprevious<CR>

" BufferList Visualization
nnoremap <leader><space> :ls<CR>


"  SPLITTED WINDOWS GENERATE

" Vertical split
nnoremap <leader><leader> :belowright vertical split<CR>
nnoremap <leader>\| :aboveleft vertical split<CR>

" Horizontal split
nnoremap ;; :belowright split<CR>
nnoremap ;: :aboveleft split<CR>


"  SPLITTED WINDOWS MOVE SIMPLIFICATION
nnoremap .. :vertical resize -1<CR>
" Turns ,, and .. in vertical resize keys
nnoremap ,, :vertical resize +1<CR>

nnoremap <leader>u :resize +1<CR>
" Turns \u and \d into resize keys
nnoremap <leader>d :resize -1<CR>

nnoremap <leader>b :set scrollbind!<CR>

" TABS BINDINGS ########

" \c stands for create tab
" (with no new Blank buffers)
nnoremap <leader>c :tabnew %<CR>
" \x stands for exchange
nnoremap <leader>x :tabnext<CR>
" \s is close to
nnoremap <leader>s :tabprevious<CR>
" \z stands for tab zipped
nnoremap <leader>z :tabclose<CR>
" Move the tab to the right
nnoremap <leader>. :tabmove +1<CR>
" \< is to move the tab to the left
nnoremap <leader>, :tabmove -1<CR>
" \f stands for first tab
nnoremap <leader>f :tabfirst<CR>
" \l stands for last tab
nnoremap <leader>l :tablast<CR>
"
" QUICKFIX BINDING
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <leader>q :call ToggleQuickFix()<CR>


" ------------------------------------------------------------------------------------

" MACROS:

" This macro turn the change of the relative number easier
let @R=':set relativenumber!'
" Pre-sets the @i macro to be a cool window, with a terminal at the bottom and
" a file tree at the left corner
let @I=':botright terminal:topleft vertical split:Explore:vertical resize 20:resize 30'
" This macro is for opening a terminal to run some fast applications
let @O=':belowright vertical terminalPS1="> "h'
" Pre-sets the @h macro to be a html file initializer
let @H='i<!DOCTYPE html><html lang="pt-br"><head><title>TITLE</title><meta charset="utf-8"></head><body>BODY</body></html>gg'
" Pre-sets the @c macro to be a simple C program initializer
let @C = 'i/* */# include <stdio.h># include <stdlib.h>int main(void){return 0;}k$i'
let @E = ':aboveleft vertical split:Explore:vertical resize 25l'

