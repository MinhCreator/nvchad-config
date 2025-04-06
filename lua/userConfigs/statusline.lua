-- Bubbles config for lualine
local colors = {
  blue = "#61AFEF",
  cyan = "#79dac8",
  black = "#080808",
  white = "#c6c6c6",
  red = "#F85874",
  green = "#98C379",
  grey = "#444544",
  yellow = "#ECBE7B",
  dark_grey = "#2F353F",
  dark_red = "#A8545E",
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.green },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.dark_grey },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.yellow } },
  replace = { a = { fg = colors.black, bg = colors.dark_red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
  winbar = {
    -- z = { fg = colors.blue, bg = nil },
  },
}
local icons = require "userConfigs.icons"
-- local i = icons

local mode = {
  "mode",
  right_padding = 5,
  -- separator = {
  -- left = "",
  -- right = "",
  -- },
  -- right_padding = 3,
  fmt = function(str)
    local Nvim_mode = vim.api.nvim_get_mode()["mode"]
    if Nvim_mode == "n" then
      return icons.ui.Vim .. " " .. str
    elseif Nvim_mode == "i" then
      return icons.ui.Edit .. " " .. str
    elseif Nvim_mode == "v" then
      return icons.ui.Visual .. " " .. str
    elseif Nvim_mode == "R" then
      return icons.ui.Replace .. " " .. str
    end
    return icons.ui.Neovim .. " " .. str
  end,
}

local short_mode = {
  "mode",
  right_padding = 5,
  -- separator = {
  -- left = "",
  -- right = "",
  -- },
  -- right_padding = 3,
  fmt = function(str)
    local Nvim_mode = vim.api.nvim_get_mode()["mode"]
    if Nvim_mode == "n" then
      return "N"
    elseif Nvim_mode == "i" then
      return "I"
    elseif Nvim_mode == "v" then
      return "V"
    elseif Nvim_mode == "R" then
      return "R"
    end
    return icons.ui.Neovim .. " " .. str
  end,
}

local custom_lsp = {
  'lsp_status',
  icon = '󰌘', -- f013
  symbols = {
    -- Standard unicode symbols to cycle through for LSP progress:
    spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
    -- Standard unicode symbol for when LSP is done:
    done = '✓',
    -- Delimiter inserted between LSP names:
    separator = ' ',
  },
  -- List of LSP names to ignore (e.g., `null-ls`):
  ignore_lsp = {},
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local git_file_status = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}


return {
  require("lualine").setup {
    options = {
      theme = bubbles_theme,
      component_separators = {
        -- left = "",
        left = "|",
        right = "|",
        -- right = ""
      },
      section_separators = {
        -- left = "",
        -- left = "|",
        -- right = "|"
        -- right = ""
      },
      always_divide_middle = true,
      disabled_filetypes = {
        --"TelescopePrompt",
        "packer",
        -- "alpha",
        "snacks_picker_list",
        "dashboard",
        "NvimTree",
        "Outline",
        "DressingInput",
        "toggleterm",
        "lazy",
        "mason",
        "neo-tree",
        "startuptime",
      },
      refresh = {         -- sets how often lualine should refresh it's contents (in ms)
        statusline = 150, -- The refresh option sets minimum time that lualine tries
        tabline = 1000,   -- to maintain between refresh. It's not guarantied if situation
        winbar = 1000,    -- arises that lualine needs to refresh itself before this time
        -- it'll do it.

        -- Also you can force lualine's refresh by calling refresh function
        -- like require('lualine').refresh()
      },
    },
    sections = {
      lualine_a = {
        -- short_mode,
        "mode",

      },
      lualine_b = {
        { "branch", icon = "󰊢 " },
        {
          "filename",
          file_status = true,     -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 0,               -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory

          -- shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = " ", --"[+]",      -- Text to show when the file is modified.
            readonly = " ", --"[-]",      -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[Untitle]", --"-|Unnamed|-", -- Text to show for unnamed buffers.
            newfile = "[New]", --"-|New|-", -- Text to show for newly created file before first write
          },
          --icon = "",
        },
      },
      lualine_c = {
        -- { "diff", symbols = { added = ' ', modified = ' ', removed = ' ' } },
        git_file_status,
        --"%=",
        --"progress",
        --"lsp",
        --"lint_progress", --[[ add your center compoentnts here in place of this comment ]]
        --{ '%=', '%t%m', '%3p' },
        -- {
        --   "buffers",
        --   show_filename_only = true,
        --   mode = 0,
        --   hide_filename_extension = false,
        --   show_modified_status = true,
        --   max_length = vim.o.columns * 2 / 3,
        --   use_mode_colors = true,
        --   symbols = {
        --     alternate_file = " ", --" ",
        --   }
        -- },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " " },
          diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow },
            info = { fg = colors.cyan },
            --   },
          },
        },
        -- { "lsp_status" },
        custom_lsp,
      },
      lualine_y = {
        { "searchcount" },
        {
          "filetype",
          -- icon = { align = "right" },
          icon_only = true,
          -- ingnore_filetypes = { "alpha" },
          -- colored = true,
        },
        { "encoding" },
        -- { "fileformat" },
      },
      lualine_z = {

        {
          "location",
          separator = { right = "" },
          left_padding = 5,
        },
      },
    },

    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "encoding" },
      lualine_y = { "location" },
      lualine_z = {
        {
          "fileformat",
          -- icon = { align = "center" },
          -- icon_only = true,
          -- colored = true,
        },
      },
    },
    -- winbar = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = {},
    --   lualine_x = {},
    --   lualine_y = {},
    --   -- lualine_z = { { "filetype", icon_only = true, bg = nil } },
    -- },
    tabline = {},
    extensions = {},
  },
}
