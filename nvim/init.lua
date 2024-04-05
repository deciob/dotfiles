-- general global options
require("options")

-- lazy
require("lazyc")

-- install and seutp plugings
require("plugins")
require("lazy").setup("plugins")

-- lsp
require("lsp")

-- plugin specific config
require("config.lsp")
require("config.nvim-cmp")
require("config.conform")
require("config.telescope")
require("config.neo-tree")
require("config.gitblame")
require("config.lualine")
require("config.toggleterm")

-- colorscheme
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

-- formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
