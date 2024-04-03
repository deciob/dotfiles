-- general global options
require("options")

-- install and seutp plugings
require("plugins")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
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

-- formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- colorscheme
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
