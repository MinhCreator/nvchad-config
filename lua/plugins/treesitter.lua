return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = { ":TSUpdate", ":TSInstall", ":TSInstallSync" },
        event = "VeryLazy",

        opts = {
            ensure_installed = {
                --"json",
                "lua",
                "markdown",
                --"markdown_inline",
                "python",
                "gdscript",
                "html",
                "css",
                "gdshader",
                "godot_resource"
            },
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            compilers = { vim.fn.getenv('CC'), "cc", "gcc", "clang", "cl", "zig" },
            auto_install = true, -- automatically install syntax support when entering new file type buffer
        },
        config = function(_, opts)
            local configs = require("nvim-treesitter.configs")
            configs.setup(opts)
        end,
    },
    -- { "nvim-treesitter/nvim-treesitter-context" },
    -- { "kiyoon/treesitter-indent-object.nvim" },
}
