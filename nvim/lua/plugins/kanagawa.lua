return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true,
				transparent = false,
				overrides = function(colors)
					return {
						["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
						["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
						["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
						["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
						["@markup.list.markdown"] = { link = "Function" }, -- + list
						["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
					}
				end,
				theme = "wave",
			})
			--vim.cmd("colorscheme kanagawa-lotus") --light
			vim.cmd("colorscheme kanagawa-dragon") --dark
		end,
		build = function()
			vim.cmd("KanagawaCompile")
		end,
	},
}
