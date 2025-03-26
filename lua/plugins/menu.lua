return {
    {
        "nvzone/menu",
        lazy = true,
    },
    {
        "nvzone/minty",
        cmd = { "Shades", "Huefy" },
    },

    -- add ui for luasnip
    {
        "chrisgrieser/nvim-scissors",
        event = "BufReadPre",
        lazy = true,
        opts = {
            snippetDir = vim.fn.stdpath("config") .. "/snippets/project-specific",
        },
    },
}
