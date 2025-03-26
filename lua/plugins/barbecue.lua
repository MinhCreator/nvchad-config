return {
    "utilyre/barbecue.nvim",
    lazy = true,
    event = { "LspAttach", "VeryLazy", "BufReadPre" },
    dependencies = {
        "SmiteshP/nvim-navic",
    },
    opts = {},
}
