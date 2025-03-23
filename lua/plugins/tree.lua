return {
    "nvim-tree/nvim-tree.lua",
    opts = function()
        local ico = require "userConfigs.icons"
        return {
            filters = { dotfiles = false },
            disable_netrw = false,
            hijack_cursor = true,
            sync_root_with_cwd = true,

            update_focused_file = {
                enable = true,
                update_root = true,
            },
            view = {
                width = 30,
                preserve_window_proportions = true,
            },
            renderer = {
                root_folder_label = false,
                highlight_git = true,
                indent_markers = { enable = true },

                icons = {
                    glyphs = {
                        default = "󰈚",
                        folder = {
                            default = ico.ui.Folder,
                            empty = ico.ui.EmptyFolder,
                            empty_open = ico.ui.EmptyFolderOpen,
                            open = ico.ui.FolderOpen,
                            symlink = "",
                        },
                        git = { unmerged = "" },
                    },
                },
            },
            -- show = {
            --     file = true,
            --     folder = true,
            --     folder_arrow = true,
            --     git = true,
            --     modified = true,
            --     hidden = false,
            --     diagnostics = true,
            --     bookmarks = false,
            -- },
            git = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = false,
                disable_for_dirs = {},
                timeout = 400,
                cygwin_support = false,
            },
            diagnostics = {
                enable = false,
                show_on_dirs = false,
                show_on_open_dirs = true,
                debounce_delay = 500,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            modified = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = false,
            },
        }
    end,
    config = function(_, opts)
        local nvimtree = require("nvim-tree")

        nvimtree.setup(opts)

        local function open_tree_on_setup(args)
            vim.schedule(function()
                local file = args.file
                local buf_name = vim.api.nvim_buf_get_name(0)
                local is_no_name_buffer = buf_name == "" and vim.bo.filetype == "" and vim.bo.buftype == ""
                local is_directory = vim.fn.isdirectory(file) == 1

                if not is_no_name_buffer and not is_directory then
                    return
                end

                if is_directory then
                    vim.cmd.cd(file)
                end

                require("nvim-tree.api").tree.open()
            end)
        end

        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("nvim-tree", { clear = true }),
            callback = open_tree_on_setup,
        })
    end,
    enabled = false,
}
