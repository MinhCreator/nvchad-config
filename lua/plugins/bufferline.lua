return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = "*",
    opts = function()
        require("userConfigs.tabline")
    end,
}