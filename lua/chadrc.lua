-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local nvchadconfig = {}

nvchadconfig.base46 = {
  theme = "onenord",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

nvchadconfig.ui = {
  integration = {
    "cmp",
    "git",
    "colorify",
    "lsp",
  },
  cmp = {
    -- -- icons_left = false, -- only for non-atom styles!
    -- style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    -- abbr_maxwidth = 60,
    format_colors = {
      tailwind = true, -- will work for css lsp too
      icon = "󱓻",
    },
    border_style = "rounded",
  },
  statusline = {

    enabled = false,
    -- theme = "defaults",  , "cwd"
    order = { "mode", "file", "git", "%=", "diagnostics", "lsp", "cwd", "cursor" }, --"lsp_msg"
    separator_style = "round",
    modules = {},
  },

  lsp = { signature = true },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true, rbga = true, hsl = true },
    modules = {},
  },

  tabufline = {
    enabled = false,
    -- 	modules = {},
    -- 	order = { "treeOffset", "buffers", "tabs", "diagnostics", "btns" },
    -- }
  },
}
-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return nvchadconfig
