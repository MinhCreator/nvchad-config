vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
local g = vim.g
g.mapleader = " "
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
local lazy = require "userConfigs.lazy"
-- load plugins
require("lazy").setup({
    -- load plugins from spec
    {
      "NvChad/NvChad",
      lazy = false,
      branch = "v2.5",
      import = "nvchad.plugins",
    },
    { import = "plugins" },
    --manual check for plugin updates

  },
  lazy)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
require "user_autocmds"
require "configs.neovide"
vim.schedule(function()
  require "mappings"
end)
