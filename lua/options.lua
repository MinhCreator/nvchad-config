require "nvchad.options"

-- add yours here!
local opt = vim.opt

opt.termguicolors = true

-- Set tabs to 2 spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

-- Enable auto indenting and set it to spaces
opt.smartindent = true
opt.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
opt.breakindent = true

-- Enable incremental searching
opt.incsearch = true
opt.hlsearch = true

-- Disable text wrap
opt.wrap = true

-- Set leader key to space
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Better splitting
-- opt.splitbelow = false
-- opt.splitright = true

-- Enable mouse mode
-- opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
opt.ignorecase = true
opt.smartcase = true

-- Decrease updatetime to 250ms
opt.updatetime = 250

-- Set completeopt to have a better completion experience
opt.completeopt = { "menu", "menuone", "noselect" }

-- Enable persistent undo history
opt.undofile = true

-- Enable 24-bit color
-- opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
opt.signcolumn = "yes"

-- Enable access to System Clipboard
opt.clipboard = "unnamed,unnamedplus"

-- Enable cursor line highlight
-- opt.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
-- opt.foldlevel = 99
-- opt.foldlevelstart = 99
-- opt.foldenable = true
-- opt.foldcolumn = "0"
-- opt.foldnestmax = 5
-- opt.foldtext = ""

-- Always keep 8 lines above/below cursor unless at start/end of file
opt.scrolloff = 8

-- Place a column line
opt.colorcolumn = "80"

if vim.fn.has "win32" == 1 then
  vim.o.shell = "powershell.exe"
else
  return
end

--Add AutoSave
local api = vim.api
local fn = vim.fn
local delay = 250 -- ms
local autosave = api.nvim_create_augroup("autosave", { clear = true })

-- Initialization
api.nvim_create_autocmd("BufRead", {
  pattern = "*",
  group = autosave,
  callback = function(ctx)
    api.nvim_buf_set_var(ctx.buf, "autosave_queued", false)
    api.nvim_buf_set_var(ctx.buf, "autosave_block", false)
  end,
})

api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "BufLeave", "FocusLost" }, {
  pattern = "*",
  group = autosave,
  callback = function(ctx)
    -- conditions that donnot do autosave
    local disabled_ft = { "acwrite", "oil", "Alpha", "alpha" }
    if
        not vim.bo.modified
        or fn.findfile(ctx.file, ".") == "" -- a new file
        or ctx.file:match "wezterm.lua"
        or vim.tbl_contains(disabled_ft, vim.bo[ctx.buf].ft)
    then
      return
    end

    local ok, queued = pcall(api.nvim_buf_get_var, ctx.buf, "autosave_queued")
    if not ok then
      return
    end
    local msg = "File Saved " .. os.date "%H:%M:%S"
    if not queued then
      vim.cmd "silent w"
      api.nvim_buf_set_var(ctx.buf, "autosave_queued", true)
      vim.notify(msg, "warn", { title = "File Saved  " })
    end

    local block = api.nvim_buf_get_var(ctx.buf, "autosave_block")
    if not block then
      api.nvim_buf_set_var(ctx.buf, "autosave_block", true)
      vim.defer_fn(function()
        if api.nvim_buf_is_valid(ctx.buf) then
          api.nvim_buf_set_var(ctx.buf, "autosave_queued", false)
          api.nvim_buf_set_var(ctx.buf, "autosave_block", false)
        end
      end, delay)
    end
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- disable colorcolumn
local cc_default_hi = vim.api.nvim_get_hl_by_name("ColorColumn", true)
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
  callback = function()
    local cc = tonumber(vim.api.nvim_win_get_option(0, "colorcolumn"))
    if cc ~= nil then
      local lines = vim.api.nvim_buf_get_lines(0, vim.fn.line "w0", vim.fn.line "w$", true)
      local max_col = 0
      for _, line in pairs(lines) do
        max_col = math.max(max_col, vim.fn.strdisplaywidth(line))
      end
      if max_col <= cc then
        vim.api.nvim_set_hl(0, "ColorColumn", { bg = "None" })
      else
        vim.api.nvim_set_hl(0, "ColorColumn", cc_default_hi)
      end
    end
  end,
})
