require "nvchad.mappings"
--
-- -- add yours here
-- local builtin = require("telescope.builtin")
local map = vim.keymap.set

---@param noremapbool boolean
---@param silentbool boolean
---@param desc string
---@return table
local opts = function(noremapbool, silentbool, desc)
  return { noremap = noremapbool, silent = silentbool, desc = desc }
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "p", "<cmd>:echo expand('%:p')<cr>", opts(true, true, "Show file path"))

-- nvimtree
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<C-t>", function()
  require("minty.huefy").open() -- open("default")
end, opts(true, true, "open right click menu"))

-- right click menu
-- mouse users + nvimtree users!
map({ "n", "v" }, "<RightMouse>", function()
  require('menu.utils').delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})

-- Add this to your existing mappings
-- map("n", "<leader>fc", function()
--     -- Use Telescope to find files in the Neovim config directory
--     builtin.find_files({
--         cwd = vim.fn.stdpath("config"),
--         prompt_title = "Neovim Config Files"
--     })
-- end, { desc = "Find files in Neovim config" })
-- map("n", "<space>n", ":Telescope resume<cr>", { noremap = true, desc = "Resume last action", silent = true })

-- toggle home screen
map("n", "<c-a>", "<cmd>Alpha<cr>", opts(true, true, "Toggle home screen"))
-- map("n", "<c-a>", "<cmd>Alpha<cr>", { noremap = true, desc = "Toggle home screen" })

map({ "n", "v" }, "<C-z>", "<cmd>undo<cr>", opts(true, true, "Undo"))
map({ "n", "v" }, "<C-y>", "<cmd>redo<cr>", opts(true, true, "Redo"))

map({ "n", "v", "i" }, "<C-c>", '"+y', opts(true, false, "Copy to clipboard"))
map({ "n", "v", "i" }, "<C-v>", '"+p', opts(true, false, "Paste from clipboard"))
map({ "n", "v", "i" }, "<C-x>", '"+x', opts(true, false, "Cut from clipboard"))

-- toggle notify
map("n", "<S-n>", "<cmd>Telescope notify<cr>", opts(true, true, "Toggle notify"))

map("n", "<leader>e", "<cmd>lua Snacks.explorer()<cr>", opts(true, true, "File Explorer"))

-- map('n', 'zC',
-- function() return require('fold-cycle').close_all() end,
-- { remap = true, silent = true, desc = 'Fold-cycle: close all folds' })

map("n", "<C-p>", "<cmd>lua print(vim.bo.filetype)<cr>", opts(true, true, "Print filetype"))

-- Open compiler
map("n", "<F6>", "<cmd>CompilerOpen<cr>", opts(true, true, "Open compiler"))

-- Redo last selected option
map(
  "n",
  "<S-F6>",
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
  opts(true, true, "Redo last selected option")
)

-- Toggle compiler results
map("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", opts(true, true, "Toggle compiler results"))

--Toggle buffers
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts(true, true, "Next tab"))
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts(true, true, "Previous tab"))
map("n", "<C-w>", "<cmd>bdelete<cr>", opts(true, true, "Close buffer"))

-- toggle luasnip ui
map("n", "<leader>a", "", opts(true, true, "Toggle luasnip ui"))
map(
  "n",
  "<leader>ae",
  function() require("scissors").editSnippet() end,
  opts(false, true, "Snippet: Edit")
)

-- when used in visual mode, prefills the selection as snippet body
map(
  { "n", "x" },
  "<leader>aa",
  function() require("scissors").addNewSnippet() end,
  opts(true, true, "Snippet: Add")
)
