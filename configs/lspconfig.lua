local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "html",
  "cssls",
  "tsserver",
  "bashls",  -- bash-language-server
  "cmake",  -- cmake-language-server
  "jedi_language_server",  -- jedi-language-server
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- for shut down the warning:
-- multiple different client offset_encodings detected for buffer, this is not supported yet
-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issuecomment-997226723
local clangd_cap = vim.lsp.protocol.make_client_capabilities()
clangd_cap.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = clangd_cap
})

--
-- lspconfig.pyright.setup { blabla}
