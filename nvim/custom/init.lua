local g = vim.g

g.neoformat_try_node_exe = 1

vim.o.scrolloff = 5

-- make copy&paste more sane!
vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- Set up Prettier autocmd
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.scss,*.html,*.md,*.vue,*.yaml,*.yml PrettierAsync
  augroup END
]])




