return {
  {
    "folke/noice.nvim",
    -- enabled = false,
    lazy = true,
    -- enabled = use_noice,
    dependencies = {
      { "MunifTanjim/nui.nvim", enabled = true }, --use_noice },
      { "rcarriga/nvim-notify", enabled = true },
    },
    event = "BufWinEnter",
    opts = {
      messages = {
        enabled = true,
      },
      notify = {
        enabled = true,
      },
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          -- position = {
          --     row = 10,
          --     col = "55%",
          -- },
          -- size = {
          --     width = 60,
          --     height = "auto",
          -- },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },

      },
    },

    keys = {
      {
        "<S-Enter>",
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end,
        mode = "c",
        desc = "Redirect Cmdline",
      },
      {
        "<leader>snl",
        function()
          require("noice").cmd("last")
        end,
        desc = "Noice Last Message",
      },
      {
        "<leader>snh",
        function()
          require("noice").cmd("history")
        end,
        desc = "Noice History",
      },
      {
        "<leader>sna",
        function()
          require("noice").cmd("all")
        end,
        desc = "Noice All",
      },
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll forward",
        mode = { "i", "n", "s" },
      },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll backward",
        mode = { "i", "n", "s" },
      },
    },
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "VeryLazy",
    config = function()
      local cmp = require("cmp")
      local mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      }

      -- Use buffer source for `/`.
      cmp.setup.cmdline("/", {
        preselect = "none",
        completion = {
          completeopt = "menu,preview,menuone,select",
        },
        mapping = mapping,
        sources = {
          { name = "buffer" },
        },
        experimental = {
          ghost_text = true,
          native_menu = false,
        },
      })

      -- Use cmdline & path source for ':'.
      cmp.setup.cmdline(":", {
        preselect = "none",
        completion = {
          completeopt = "menu,preview,menuone,select",
        },
        mapping = mapping,
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        experimental = {
          ghost_text = true,
          native_menu = false,
        },
      })
    end,
  },

}
