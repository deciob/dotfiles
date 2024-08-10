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


-- Setup language servers.

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
    if lsp == 'cssls' then
        lspconfig.cssls.setup({
            capabilities = capabilities,
        })
    elseif true then
        lspconfig[lsp].setup {}
    end
end

-- In case you need to pass some specific settings, here is an example:
--lspconfig.rust_analyzer.setup {
--  -- Server-specific settings. See `:help lspconfig-setup`
--  settings = {
--    ['rust-analyzer'] = {},
--  },
--}
