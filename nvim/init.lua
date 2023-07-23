require('plugins')
require('keybindings')


-- [[ Setting options ]]
-- See `:help vim.o`

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Don't scroll near the end of the page
vim.o.scrolloff = 5

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Emit true (24-bit) colours.
vim.o.termguicolors = true
require('solarized').set()
