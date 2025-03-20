return {
    "LunarVim/bigfile.nvim",
    lazy = true,
    event = "BufReadPre",
    opts = {
        filesize = 3, -- size of the file in MiB, the plugin round file sizes to the closest MiB
    },
    config = function(_, opts)
        require("bigfile").setup(opts)
    end,
}
