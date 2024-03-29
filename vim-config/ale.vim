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
    \ 'tsx': ['tsserver', 'eslint'],
    \ 'jsx': ['eslint'],
    \ 'json': ['jsonlint'],
    \ 'elm': ['make'],
    \ 'scss': ['stylelint'],
    \ 'css': ['stylelint'],
    \}

    "\ 'elm': ['make', 'elm_ls'],

"
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
    \   'typescript': ['prettier'],
    \   'typescriptreact': ['prettier'],
    \   'json': ['fixjson', 'prettier'],
    \   'markdown': [],
    \   'elm': ['elm-format'],
    \   'scss': ['prettier', 'stylelint'],
    \   'css': ['prettier', 'stylelint'],
    \   'html': ['prettier'],
    \}
let g:ale_fix_on_save = 1
"let g:ale_use_global_executables = 1
let g:ale_completion_enabled = 1

let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_echo_cursor = 0

"appearance
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

"language server
let g:ale_elm_ls_use_global = 1
let g:ale_elm_ls_executable = "elm-language-server"
let g:ale_elm_ls_elm_path = "elm"
let g:ale_elm_ls_elm_format_path = "elm-format"
let g:ale_elm_ls_elm_test_path = "elm-test"

map <F5> :ALEGoToDefinition<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""" ale
