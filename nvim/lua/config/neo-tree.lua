-- KEYMAPS

local keymap = vim.api.nvim_set_keymap
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

keymap("n", "<F2>", "<cmd> Neotree toggle <CR>", opts)
keymap("n", "<F3>", "<cmd> Neotree reveal <CR>", opts)
