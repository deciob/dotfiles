-- Basically like telescope, but with fzf ;)

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	--dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files in current working directory",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find files in nvim config directory",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find words in current working directory with rg (ripgrep)",
		},
		{
			"<leader>f/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "Find words in current buffers with rg (ripgrep)",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "Search word under cursor in current working directory",
		},
		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "Search WORD under cursor in current working directory",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "Find fzf-lua builtin commands",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "Find within the nvim builtin documentation",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "Find keymaps",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "Resume previous search",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "Find diagnostics",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldFiles()
			end,
			desc = "Find recently opened files across all projects",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find files in current buffers",
		},
	},
}
