require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- if you just want default config for the servers then put them in a table
local servers = {
    "lua_ls",
    "html",
    "cssls",
    "elmls",
    "tsserver",
    "clangd",
    "terraformls",
    "tflint",
    "jsonls",
    "pyright",
}

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = servers,
})

--require('mason-tool-installer').setup({
--
--    -- a list of all tools you want to ensure are installed upon
--    -- start
--    ensure_installed = {
--        'black',
--        'debugpy',
--        'flake8',
--        'isort',
--        'mypy',
--        'pylint',
--    }
--})

-- Setup language servers.

local lspconfig = require('lspconfig')

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {}
end

-- In case you need to pass some specific settings, here is an example:
--lspconfig.rust_analyzer.setup {
--  -- Server-specific settings. See `:help lspconfig-setup`
--  settings = {
--    ['rust-analyzer'] = {},
--  },
--}
