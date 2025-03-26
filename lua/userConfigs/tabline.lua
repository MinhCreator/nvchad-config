local tabline = require "bufferline"
return {
  require("bufferline").setup {
    options = {
      mode = "buffers",                            -- set to "tabs" to only show tabpages instead
      style_preset = tabline.style_preset.default, -- or bufferline.style_preset.minimal,
      --themable = true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
      --numbers = "ordinal",
      -- separator_style = "", --"thin",
      buffer_close_icon = "󰅖",
      modified_icon = "● ",
      close_icon = " ",
      left_trunc_marker = " ",
      right_trunc_marker = " ",
      indicator = {
        icon = " ",
        style = "icon",
      },

      --max_name_length = 18,
      --max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      --truncate_names = true, -- whether or not tab names should be truncated
      --tab_size = 18,
      -- diagnostics = "nvim_lsp",
      -- diagnostics_update_on_event = true, -- use nvim's diagnostic handler

      -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or " ")
          s = s .. n .. sym
        end
        return s
      end,

      offsets = {
        --{
        text_align = "center",
        --separator = true,
        --},
        {
          filetype = "snacks_picker_list",
          text = "File Explorer",
          highlight = "Directory",
          sepactor = true,
        },
      },
      color_icons = true,       -- whether or not to add the filetype icon highlights

      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      --duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
      --move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      custom_areas = {
        right = function()
          local result = {}
          local seve = vim.diagnostic.severity
          local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
          local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
          local info = #vim.diagnostic.get(0, { severity = seve.INFO })
          local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

          if error ~= 0 then
            table.insert(result, { text = " " .. error, link = "DiagnosticError", fg = "#ff0303" })
          end

          if warning ~= 0 then
            table.insert(result, { text = " " .. warning, link = "DiagnosticWarn", fg = "#f7ac4a" })
          end

          if hint ~= 0 then
            table.insert(result, { text = " " .. hint, link = "DiagnosticHint", fg = "#7a4efc" })
          end

          if info ~= 0 then
            table.insert(result, { text = " " .. info, link = "DiagnosticInfo", fg = "#4edafc" })
          end
          return result
        end,
      },
    },
  },
}
