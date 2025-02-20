return {
    -- Markdown Preview
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    -- TMUX Integration
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    -- Smooth Cursor
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
    -- Dashboard
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local startify = require("alpha.themes.startify")
            startify.file_icons.provider = "devicons"
            require("alpha").setup(startify.config)
        end,
    },
    -- Session Management, open the last session
    {
        "rmagatti/auto-session",
        lazy = false,
        opts = {},
    },
    -- Hop
    {
        "smoka7/hop.nvim",
        config = function()
            -- Hop configuration
            vim.api.nvim_set_keymap("", "S", "<cmd>HopChar1MW<CR>", {})
            vim.api.nvim_set_keymap("", "s", "<cmd>HopChar1<CR>", {})
            -- you can configure Hop the way you like here; see :h hop-config
            require("hop").setup({})
        end,
    },
    -- Show shortcuts
    -- Disabled for now. Trying to avoid
    -- {
    --     "folke/which-key.nvim",
    --     config = function()
    --         require("which-key").setup({})
    --     end,
    -- },
    -- Treefile
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                diagnostics = {
                    enable = false,
                    show_on_dirs = false,
                    icons = {
                        hint = "",
                        info = "",
                        error = "",
                    },
                },
                update_focused_file = {
                    enable = true,
                },
                view = {
                    adaptive_size = true,
                },
                filters = {
                    dotfiles = false,
                },
            })

            vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
        end,
    },
    -- Show errors on lines
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
    -- Find files
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                pickers = {
                    live_grep = {
                        file_ignore_patterns = { "node_modules", ".git", ".venv" },
                        additional_args = function(_)
                            return { "--hidden" }
                        end,
                    },
                    find_files = {
                        file_ignore_patterns = { "node_modules", ".git", ".venv" },
                        hidden = true,
                    },
                },
                extensions = {
                    "fzf",
                },
            })

            -- Run: cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim && make && cd -
            -- If you have any issues with the fzf native
            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
        end,
    },
    -- Treesitter. Add color highlight
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        opts = {
            sync_install = true,
            highlight = { enabled = true },
            indent = { enabled = true },
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
                "rust",
                "go",
            },
        },
    },
    -- Manage the surrounds (parentheses, brackets, etc)
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    -- Autoclose
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    -- Jump between specific pages
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            local add = function()
                print("Harpoon added")
                harpoon:list():add()
            end

            vim.keymap.set("n", "<leader>a", add)
            vim.keymap.set("n", "<leader>fe", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            vim.keymap.set("n", "<leader>1", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<leader>2", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<leader>3", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<leader>4", function()
                harpoon:list():select(4)
            end)
        end,
    },
}
