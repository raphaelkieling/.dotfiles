return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy =false,
    --     priority=1000,
    --     config=function()
    --         vim.cmd[[colorscheme tokyonight]]
    --     end
    -- }
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({})
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
