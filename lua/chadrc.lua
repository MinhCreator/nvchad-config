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
	},
	statusline = {
		-- theme = "defaults",  , "cwd"
		order = { "mode", "file", "git", "%=", "diagnostics", "lsp", "cursor" }, --"lsp_msg"
		-- separator_style = "round",
		modules = {},
	},
	-- tabufline = {
	-- 	modules = {},
	-- 	order = { "treeOffset", "buffers", "tabs", "diagnostics", "btns" },
	-- }
}
-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return nvchadconfig
