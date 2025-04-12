-- KEYMAPS

vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

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
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", opts)

-- Diagnostics
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float window" })

-- Formatting
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({lsp_format="fallback"})
end, { desc = "Format code" })
