-- WARN : this dedicated feature
-- load defaults i.e lua_lsp
-- require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

lspconfig.servers = {
  "html",
  "cssls",
  "lua_ls",
  "emmet_ls",
  "pyright",
}
local lsp_defaults = {
  "html",
  "cssls",
  "lua_ls",
  "emmet_ls",
  "pyright", }

-- lsp with multiple language server config
for _, lsp in ipairs(lsp_defaults) do
  lspconfig[lsp].setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
