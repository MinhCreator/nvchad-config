return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = function()
        return require "userConfigs.telescope"
    end,
    configs = function(_, opts)
        local telescopes = require "telescope"
        telescopes.setup(opts)
        -- telescopes.load_extension "themes"
        -- telescopes.load_extension "terms"
    end,
}
