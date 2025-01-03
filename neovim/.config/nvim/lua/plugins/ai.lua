return {
    {
        "github/copilot.vim",
        config = function()
            -- Disable Copilot for tab completion
            vim.g.copilot_no_tab_map = false

            -- Setup keybindings
            -- For cases where i do not want to use tab
            vim.api.nvim_set_keymap("i", "<C-S-r>", "copilot#Accept()", { expr = true, noremap = true })
        end,
    },
}
