return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy =false,
    --     priority=1000,
    --     opts = { style = "day" },
    --     config=function()
    --         vim.cmd[[colorscheme tokyonight]]
    --     end
    -- }
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({})
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
}
