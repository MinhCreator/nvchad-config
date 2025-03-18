local mason_tool_installer = require("mason-tool-installer")
local formater = { "prettier", "stylua" }
mason_tool_installer.setup({
    ensure_installed = formater,
})
