require "nvchad.mappings"
--
-- -- add yours here
-- local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "p", "<cmd>:echo expand('%:p')<cr>", { noremap = true, silent = false, desc = "Show path" })

-- nvimtree
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
-- right click menu
map("n", "<C-t>", function()
  require("minty.huefy").open() -- open("default")
end, {})

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
map("n", "<c-a>", "<cmd>Alpha<cr>", { noremap = true, desc = "Toggle home screen" })
-- close buffer
map("n", "<c-w>", function()
  require("nvchad.tabufline").close_buffer()
end, { noremap = true, desc = "Close buffer" })

map({ "n", "v" }, "<c-z>", "<cmd>undo<cr>", { noremap = true, desc = "Undo" })
map({ "n", "v" }, "<c-y>", "<cmd>redo<cr>", { noremap = true, desc = "Redo" })


-- toggle notify
map("n", "<s-n>", "<cmd>Telescope notify<cr>", { noremap = true, desc = "Telescope notify" })

map("n", "<leader>e", "<cmd>lua Snacks.explorer()<cr>", { noremap = true, desc = "File Explorer" })

-- map('n', 'zC',
-- function() return require('fold-cycle').close_all() end,
-- { remap = true, silent = true, desc = 'Fold-cycle: close all folds' })

map('n', '<c-p>', '<cmd>lua print(vim.bo.filetype)<cr>', { noremap = true, desc = "Show filetype" })
