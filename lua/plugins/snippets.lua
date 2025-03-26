local snipPath = vim.fn.stdpath("config") .. "nvim/snippets"
return {
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { snipPath } })
        end,
    }
}


