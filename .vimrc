" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
" - :PlugInstall to install plugins
call plug#begin('~/.vim/plugged')

" The NERDTree is a file system explorer for the Vim editor.
Plug 'scrooloose/nerdtree'

" Plugin for the Elm programming language
Plug 'elmcast/elm-vim'

" Fuzzy search
Plug 'kien/ctrlp.vim'

" Initialize plugin system
call plug#end()

""""""""

colorscheme solarized
syntax enable           " enable syntax processing

"set tabstop=4           " number of visual spaces per TAB
"set softtabstop=4       " number of spaces in tab when editing
"set expandtab           " tabs are spaces

set number              " show line numbers
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files

set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.

set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" map nerdtree to F2
map <F2> :NERDTreeToggle<CR>

" We can use different key mappings for easy navigation between splits to save
" a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
