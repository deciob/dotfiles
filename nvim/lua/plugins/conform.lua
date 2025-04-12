local prettier = { "prettierd", "prettier", stop_after_first = true }
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Conform will run the first available formatter
			javascript = prettier,
			typescript = prettier,
			astro = prettier,
			json = prettier,
			css = prettier,
			scss = prettier,
			html = prettier,
			yaml = prettier,
			markdown = prettier,
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
