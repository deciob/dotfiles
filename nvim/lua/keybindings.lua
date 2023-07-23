-- Splits navigation
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { desc = '' })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { desc = '' })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { desc = '' })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { desc = '' })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local telescope = require "telescope"
local actions = require "telescope.actions"
telescope.setup {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
        },
      },
    },
}

-- Check https://neovim.io/doc/user/lsp.html
--vim.api.nvim_create_autocmd('LspAttach', {
--  callback = function(args)
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
--  end,
--})


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- Close quickfix
vim.keymap.set('n', '<leader>q', '<Cmd>cclose<CR>', { noremap = true, silent = true })
