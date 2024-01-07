local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- terraformls: https://github.com/hashicorp/terraform-ls 
-- tflint: https://github.com/terraform-linters/tflint 
local servers = { "html", "cssls", "tsserver", "clangd", "terraformls", "tflint"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

