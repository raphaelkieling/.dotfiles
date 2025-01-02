return {
    {
        "github/copilot.vim",
        config = function()
            -- Disable Copilot for tab completion
            vim.g.copilot_no_tab_map = true

            -- Setup keybindings
            vim.api.nvim_set_keymap("i", "<C-S-r>", "copilot#Accept()", { expr = true, noremap = true })
        end,
    },
}
