local mason_tool_installer = require "mason-tool-installer"
local formater = { "prettier", "stylua", "gdtoolkit" }

return {
  mason_tool_installer.setup {
    ensure_installed = formater,
    -- automatic_installation = true,
    -- run_on_start = true,
    integrations = {
      ["mason-lspconfig"] = true,
    },
  },
}
