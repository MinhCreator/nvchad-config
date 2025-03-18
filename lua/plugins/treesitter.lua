return
{
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = { ":TSUpdate", ":TSInstall" },
    event = "VeryLazy",

    opts = {
        ensure_installed = {
            --"json",
            "lua",
            --"markdown",
            --"markdown_inline",
        },
        highlight = {
            enable = true,
        },
        indent = { enable = true },
        compilers = { "gcc" },
        auto_install = true, -- automatically install syntax support when entering new file type buffer
    },
    config = function(_, opts)
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts)
    end,
}
