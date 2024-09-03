-- KEYMAPS

local keymap = vim.api.nvim_set_keymap
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

vim.o.scrolloff = 5
vim.g.mapleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
-- keymap(<mode>, <key>, <action>, <opts>)

-- make copy&paste more sane!
--keymap("v", "p", '"_dP', opts)

-- fast scroll
keymap("n", "<C-e>", "3<C-e>", opts)
keymap("n", "<C-y>", "3<C-y>", opts)

-- Hint: see `:h vim.map.set()`
-- We can use different key mappings for easy navigation between splits to save
-- a keystroke. So instead of ctrl-w then j, it’s just ctrl-j:
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)


-- Global Options

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4        -- number of visual spaces per TAB
vim.opt.softtabstop = 4    -- number of spacesin tab when editing
vim.opt.shiftwidth = 4     -- insert 4 spaces on a tab
vim.opt.expandtab = true   -- tabs are spaces, mainly because of python
vim.opt.smartindent = true -- Enable smart indenting

-- UI config
vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true     -- open new vertical split bottom
vim.opt.splitright = true     -- open new horizontal splits right
vim.opt.termguicolors = true  -- enabl 24-bit RGB color in the TUI
vim.opt.lazyredraw = true     -- redraw only when we need to.
vim.opt.showmode = true

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- highlight matches
vim.opt.showmatch = true  -- highlight matching [{()}]
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- Set indentation guide lines
vim.opt.listchars.tab = "|-"
vim.opt.list = true

-- Set up Python-specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.colorcolumn = "80" -- Highlight column 80 for PEP 8 compliance
        vim.opt_local.textwidth = 79     -- Set text width to 79 for PEP 8 compliance
    end,
})

-- Command aliases
-- vim.api.nvim_create_user_command('AliasName', 'OriginalCommand', {})

vim.api.nvim_create_user_command('Spch', 'setlocal spell spelllang=en_gb', {})
