-- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim
-- and to provide some basic functionality such as highlighting based on it.

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"astro",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"typescript",
				"elm",
				"javascript",
				"html",
				"css",
				"scss",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>", -- set to `false` to disable one of the mappings
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},
		})
	end,
}
