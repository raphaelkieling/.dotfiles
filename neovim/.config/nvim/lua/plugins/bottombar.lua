return {
    -- Bottom bar
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "dracula",
                disabled_filetypes = {
                    statusline = { "NvimTree" },
                    winbar = {},
                },
            },
        },
    },
}
