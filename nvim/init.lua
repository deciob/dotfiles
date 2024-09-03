-- general global options
require("options")

-- lazy
require("lazyc")

-- install and seutp plugings
require("plugins")
require("lazy").setup("plugins")

-- lsp
require("lsp")

-- initialise plugin specific config
require("config.lsp")
require("config.nvim-cmp")
require("config.conform")
require("config.telescope")
require("config.neo-tree")
require("config.gitblame")
require("config.lualine")
require("config.toggleterm")
require("config.colorizer")

-- colorscheme
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

-- Set up custom syntax highlighting for code blocks
vim.cmd([[
  function! VimwikiHighlight()
    syntax include @Python syntax/python.vim
    syntax region pythonCode start="{{{python" end="}}}" contains=@Python
    syntax include @Lua syntax/lua.vim
    syntax region luaCode start="{{{lua" end="}}}" contains=@Lua
    syntax include @Vim syntax/vim.vim
    syntax region vimCode start="{{{vim" end="}}}" contains=@Vim
    syntax include @CSS syntax/css.vim
    syntax region cssCode start="{{{css" end="}}}" contains=@CSS
    syntax include @HTML syntax/html.vim
    syntax region htmlCode start="{{{html" end="}}}" contains=@HTML
  endfunction

  autocmd FileType vimwiki call VimwikiHighlight()
]])
