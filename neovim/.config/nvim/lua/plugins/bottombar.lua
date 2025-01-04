return {
    -- Bottom bar
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                disabled_filetypes = {
                    statusline = { "NvimTree" },
                    winbar = {},
                },
            },
        },
    },
}
