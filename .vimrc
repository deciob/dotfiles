" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
" - :PlugInstall to install plugins
call plug#begin('~/.vim/plugged')

" The NERDTree is a file system explorer for the Vim editor.
Plug 'scrooloose/nerdtree'

" Plugin for the Elm programming language
Plug 'elmcast/elm-vim'

" Fuzzy search
"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Indent markers
Plug 'Yggdroot/indentLine'

" Surround...
Plug 'tpope/vim-surround'

" Manage open buffers
Plug 'jlanzarotta/bufexplorer'

:" JS
Plug 'pangloss/vim-javascript'

" React
Plug 'mxw/vim-jsx'

" Expand abbreviations...
"Plug 'mattn/emmet-vim'

" Lint engine
Plug 'w0rp/ale'

" Pick editor configuration from a .editorconfig file
Plug 'editorconfig/editorconfig-vim'

" Perform search in files easily...
"Plug 'eugen0329/vim-esearch'

" Initialize plugin system
call plug#end()

" Reload to install new plugins (:source ~/.vimrc) and then run (:PlugInstall)

""""""""

colorscheme solarized
syntax enable           " enable syntax processing

filetype plugin indent on
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set shiftwidth=4        " when indenting with '>', use 4 spaces width

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

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

" map bufexplorer to F12
nnoremap <F12> :BufExplorer<CR> 

" We can use different key mappings for easy navigation between splits to save
" a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Trim trailing whitespaces and reset the cursor
" https://unix.stackexchange.com/questions/75430/how-to-automatically-strip-trailing-spaces-on-save-in-vi-and-vim/75438
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Using file extension
autocmd BufWritePre *.js,*.elm :call <SID>StripTrailingWhitespaces()

" In this example, both absolute and relative line numbers are enabled by
" default, which produces “hybrid” line numbers. When entering insert mode,
" relative line numbers are turned off, leaving absolute line numbers turned
" on. This also happens when the buffer loses focus, so you can glance back at
" it to see which absolute line you were working on, if you need to.
" see: https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Don't scroll near the end of the page
set scrolloff=5

" Enable the use of the mouse
set mouse=a

" Set indentation guide lines
set listchars=tab:\|\ 
set list

"unbind elm-vim mappings
let g:elm_setup_keybindings = 0

"rebind used elm-vim mappings
"nnoremap <silent> <leader>m :<C-u>call elm#Make()<CR>
"nnoremap <silent> <leader>e :<C-u>call elm#ErrorDetail()<CR>
"nnoremap <silent> <Plug>(elm-make-main) :<C-u>call elm#Make("Main.elm")<CR>
"nnoremap <silent> <Plug>(elm-test) :<C-u>call elm#Test()<CR>
"nnoremap <silent> <Plug>(elm-repl) :<C-u>call elm#Repl()<CR>
"nnoremap <silent> <Plug>(elm-show-docs) :<C-u>call elm#ShowDocs()<CR>
"nnoremap <silent> <Plug>(elm-browse-docs) :<C-u>call elm#BrowseDocs()<CR>

" easier use of the 'black hole register'
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" paste stuff from outside 
" press F5 before and after pasting to preserve indentation
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

" use jsx extent on js files
let g:jsx_ext_required = 0

" Force ale to use eslint
let g:ale_linters = { 'javascript': ['eslint'], }

" ale mappings
nmap <silent> <C-S-j> :ALENext<cr>
nmap <silent> <C-S-k> :ALEPrevious<cr>
nnoremap <silent> <leader>e :ALEDetail<CR>
