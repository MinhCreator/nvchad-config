local telescopes = require "telescope"
local options = {
  defaults = {
    -- configure to use ripgrep
    vimgrep_arguments = {
      "rg",
      "--follow",        -- Follow symbolic links
      "--hidden",        -- Search for hidden files
      "--no-heading",    -- Don't group matches by each file
      "--with-filename", -- Print the file path with the matched lines
      "--line-number",   -- Show line numbers
      "--column",        -- Show column numbers
      "--smart-case",    -- Smart case search

      -- Exclude some patterns from search
      "--glob=!**/.git/*",
      "--glob=!**/.idea/*",
      "--glob=!**/.vscode/*",
      "--glob=!**/build/*",
      "--glob=!**/dist/*",
      "--glob=!**/yarn.lock",
      "--glob=!**/package-lock.json",
      "--glob=!**/.",
    },
    prompt_prefix = "  ", --"  ",
    selection_caret = " ", --" ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal", --"vertical", --"horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
        --mirror = false,
        height = 0.9,
        preview_cutoff = 120,
        -- prompt_position = "bottom",
        width = 0.8,
      },
      vertical = {
        mirror = false,
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.87, --0.87,
      height = 0.81,
      preview_cutoff = 120,
    },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "build",
      "yarn.lock",
      "package-lock.json",
      "coverage",
      ".git",
      "__pycache__",
      ".vscode",
      ".idea",
      ".cache",
      ".pytest_cache",
      ".mypy_cache",
      ".ipynb_checkpoints",
      ".pytest_cache",
    },
    pickers = {
      find_files = {
        hidden = true,
        -- needed to exclude some files & dirs from general search
        -- when not included or specified in .gitignore
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/build/*",
          "--glob=!**/dist/*",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
          "--glob=!**/.",
        },
      },
    },
  },
  telescopes.load_extension "notify",
}

return options
