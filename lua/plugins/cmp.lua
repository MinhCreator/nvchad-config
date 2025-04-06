return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    dependencies = {
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-buffer",  -- buffer completions
        "hrsh7th/cmp-path",    -- path completions
        "hrsh7th/cmp-cmdline", -- cmdline completions
        "hrsh7th/cmp-calc",
        -- "tailwind-tools",
        -- "onsails/lspkind-nvim",
    },
    config = function(_, opts)
        local function border(hl_name)
            return {
                { "╭", hl_name },
                { "─", hl_name },
                { "╮", hl_name },
                { "│", hl_name },
                { "╯", hl_name },
                { "─", hl_name },
                { "╰", hl_name },
                { "│", hl_name },
            }
        end
        local icon = require("userConfigs.iconCmp")
        local icon_menu = require("userConfigs.icons").ui
        local cmp = require("cmp")
        cmp.setup({
            window = {
                completion = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│", },
                    winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
                    scrollbar = false,
                },
                documentation = {
                    border = border "CmpDocBorder",
                    winhighlight = "Normal:CmpDoc",
                },
            },

            formatting = {
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("%s %s", icon[vim_item.kind], vim_item.kind) -- This concatenates the     icons with the name of the item kind
                    -- Source

                    if entry.source.name == "calc" then
                        vim_item.kind = icon.Calc
                        -- return vim_item
                    end

                    return vim_item
                end,
                -- require("lspkind").cmp_format({
                --     before = require("tailwind-tools.cmp").lspkind_format
                -- }),
            },
            sources = {
                -- { name = 'nvim_lsp_signature_help' },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "buffer" },
                { name = "path" },
                { name = "crates" },
                { name = "calc" },
                { name = "luasnip" },
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            })
        })
    end,
}
