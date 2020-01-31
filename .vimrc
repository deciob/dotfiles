" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
" - :PlugInstall to install plugins
call plug#begin('~/.vim/plugged')

" The NERDTree is a file system explorer for the Vim editor.
Plug 'scrooloose/nerdtree'

" Plugin for the Elm programming language
" Not good enough if this does not get merged:
" https://github.com/ElmCast/elm-vim/pull/168
"Plug 'elmcast/elm-vim'

" Fuzzy search
Plug '~/app/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

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

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json'] }

"Typescript
Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'

" Track the (snippet) engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine.
Plug 'honza/vim-snippets'

" Pigments
Plug 'ap/vim-css-color'

" JSON
Plug 'elzr/vim-json'

" Fancy highlight
Plug 't9md/vim-quickhl'

" Elm hightlight
Plug 'andys8/vim-elm-syntax'

" Elm analyze
Plug 'antew/vim-elm-analyse'

" Tagbar is a Vim plugin that provides an easy way to browse the tags
" of the current file and get an overview of its structure.
Plug 'majutsushi/tagbar'

" ack in vim
Plug 'mileszs/ack.vim'

" typescript?
"Plug 'Quramy/tsuquyomi'

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

"autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd filetype javascript set sw=2 ts=2 expandtab
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2

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

" toggle tagbar
nmap <F8> :TagbarToggle<CR>
" and open on the left
let g:tagbar_left = 1
" and configure
let g:tagbar_type_elm = {
      \ 'kinds' : [
      \ 'f:function:0:0',
      \ 'm:modules:0:0',
      \ 'i:imports:1:0',
      \ 't:types:1:0',
      \ 'a:type aliases:0:0',
      \ 'c:type constructors:0:0',
      \ 'p:ports:0:0',
      \ 's:functions:0:0',
      \ ]
      \}

" We can use different key mappings for easy navigation between splits to save
" a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Done by ale already?
" Trim trailing whitespaces and reset the cursor
" https://unix.stackexchange.com/questions/75430/how-to-automatically-strip-trailing-spaces-on-save-in-vi-and-vim/75438
"function! <SID>StripTrailingWhitespaces()
"    let l = line(".")
"    let c = col(".")
"    %s/\s\+$//e
"    call cursor(l, c)
"endfun
"
"" Using file extension
"autocmd BufWritePre *.js,*.elm,*.ts :call <SID>StripTrailingWhitespaces()

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

"""""""""""""""""""""""""""""""""""""""""""""""""" ale
" ale mappings
nmap <silent> <leader>j :ALENext<cr>
nmap <silent> <leader>k :ALEPrevious<cr>
nnoremap <silent> <leader>e :ALEDetail<CR>

"let g:ale_typescript_tsserver_executable =  './node
" Force ale to use eslint
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['tsserver', 'eslint'],
    \ 'json': ['jsonlint'],
    \}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0

" To not open window on save:
"let g:ale_open_list = 'on_save'

" Show the used linter:
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier', 'eslint'],
    \   'typescript': ['prettier', 'eslint'],
    \   'json': ['fixjson', 'prettier'],
    \   'markdown': [],
    \   'elm': ['elm-format'],
    \}
let g:ale_fix_on_save = 1
let g:ale_use_global_executables = 1

"""""""""""""""""""""""""""""""""""""""""""""""""" ale

" typescript
"let g:typescript_indent_disable = 1

" Snippets. Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Remove quote concealing for json files
let g:vim_json_syntax_conceal = 0


" Make FZF's Files comand work like ctrl-p
noremap <c-p> :GFiles<cr>

" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" fast scroll
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
" https://stackoverflow.com/questions/2732267/vim-loses-undo-history-when-changing-buffers
set hidden

" run prettier before save
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

source ~/.vim/elm.vim
