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

-- Terraform
-- copied from: https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])



