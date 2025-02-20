Languages = { "lua_ls", "rust_analyzer", "gopls", "ts_ls", "yamlls", "jsonls", "pyright" }

-- On attach to the LSP, setup the keybindings
function Handler_on_attach(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    -- All the keybinding for LSP
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_set_keymap("n", "rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_set_keymap("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_set_keymap("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>ft", "<Cmd>:lua vim.diagnostic.setloclist()<CR>", opts)
    vim.api.nvim_set_keymap("n", "ga", "<Cmd>:lua vim.lsp.buf.code_action()<CR>", opts)
end

return {
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",
        opts = {
            signature = { enabled = true },
            keymap = {
                preset = "default",
                ["<C-r>"] = { "accept" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "Nerd Font",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
        opts_extend = { "sources.default" },
    },
    -- Install formatters and lsp stuff
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- Config from: https://github.com/williamboman/mason-lspconfig.nvim
            -- Responsible for download and install LSP stuff
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = Languages,
                automatic_installation = true,
            })

            -- Responsible for autocomplete
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require("lspconfig")

            for _, lang in ipairs(Languages) do
                lspconfig[lang].setup({
                    capabilities = capabilities,
                    on_attach = Handler_on_attach,
                })
            end
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettier", stop_after_first = true },
                yaml = { "yamlfix" },
                json = { "jq" },
                typescript = { "prettier", stop_after_first = true },
            },
        },
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>ff",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
    },
}
