-- Free, ultrafast Copilot alternative for Vim and Neovim

return {
	"Exafunction/windsurf.vim",
	event = "BufEnter",
	config = function()
		vim.g.codeium_enabled = false
		-- Map <leader>-llm to toggle Codeium
		vim.keymap.set("n", "<F12>", ":Codeium Toggle<CR>", { noremap = true, silent = false })
		vim.keymap.set("i", "<F1>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-;>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-,>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}
