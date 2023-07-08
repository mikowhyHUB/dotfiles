lvim.plugins = {

    -- themes
    { "lunarvim/lunar.nvim" },
    { "morhetz/gruvbox" },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/sonokai" },
    { "sainnhe/edge" },
    { "lunarvim/horizon.nvim" },
    { "tomasr/molokai" },
    { "ayu-theme/ayu-vim" },
    { "EdenEast/nightfox.nvim" },

    {
        -- wyswietla wszystkie bledy w pliku
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    { -- dla roznych plikow rozne taby (vue i python ma inne)
        "FotiadisM/tabset.nvim",
        config = function()
            require("tabset").setup()
        end
    },
    { -- nauka obslugi vima
        "m4xshen/hardtime.nvim",
        event = "VeryLazy",
        opts = {
            disable_mouse = false,
            hint = true,
            notification = true
        }
    },
    { --bajer wizualny
        "eandrju/cellular-automaton.nvim"
    },
    { -- nowe taby nowe buffery
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup({})
        end,

    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end
    },
    {
        "yioneko/nvim-yati",
        -- tag = "*",
        dependencies = "nvim-treesitter/nvim-treesitter"
    },
    {
        "ojroques/nvim-osc52"
    },

    { -- historia zmian
        "mbbill/undotree"
    },

    {
        "olimorris/persisted.nvim",
        config = function()
            require("persisted").setup({
                save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
                silent = false,                                                   -- silent nvim message when sourcing session file
                use_git_branch = false,                                           -- create session files based on the branch of the git enabled repository
                autosave = true,                                                  -- automatically save session files when exiting Neovim
                should_autosave = nil,                                            -- function to determine if a session should be autosaved
                autoload = false,                                                 -- automatically load the session for the cwd on Neovim startup
                on_autoload_no_session = nil,                                     -- function to run when `autoload = true` but there is no session to load
                follow_cwd = true,                                                -- change session file name to match current working directory if it changes
                allowed_dirs = nil,                                               -- table of dirs that the plugin will auto-save and auto-load from
                ignored_dirs = nil,                                               -- table of dirs that are ignored when auto-saving and auto-loading
                telescope = {                                                     -- options for the telescope extension
                    reset_prompt_after_deletion = true,                           -- whether to reset prompt after session deleted
                },
            })
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufRead",
        lazy = true,
        config = function()
            require("persistence").setup({
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
                module = "persistence",
            })
        end,
        nested = true,
    },
    -- gdy jakis blad masz to szybko fixuje te bledy
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    },

    { "tpope/vim-surround" }, -- automatyczne zamykanie nawiasow itp
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    { "tpope/vim-repeat" },   -- cos robi z pluginami jak sie kropke nacisnie

    { "kkharji/sqlite.lua" }, -- potrzebny do frecency
    {
        --inteligentne szukanie plikow/tekstow
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require "telescope".load_extension("frecency")
        end,
        dependencies = { "kkharji/sqlite.lua" }
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- {
    --     "jackMort/ChatGPT.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         local home = vim.fn.expand("$HOME")
    --         require("chatgpt").setup({
    --             api_key_cmd = "gpg --decrypt " .. home .. "/.gnupg/api.txt.gpg"
    --             -- api_key_cmd = "gpg --decrypt /home/mikolaj-sobczak/.gnupg/api.txt.gpg"

    --         })
    --     end,
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim"
    --     }
    -- },
    -- require("chatgpt").setup({
    --     api_key_cmd = "gpg --decrypt " .. home .. ".gnupg/api.txt.gpg"
    -- })
    -- config = function()
    --     require("chatgpt").setup({
    --     })
    -- end,

    -- table.insert(lvim.plugins, {
    --     "zbirenbaum/copilot-cmp",
    --     event = "InsertEnter",
    --     dependencies = { "zbirenbaum/copilot.lua" },
    --     config = function()
    --         local ok, cmp = pcall(require, "copilot_cmp")
    --         if ok then cmp.setup({}) end
    --     end,
    -- }),

    -- lvim.builtin.telescope.on_config_done == function(telescope)
    --     pcall(telescope.load_extension, "frecency")
    -- end
}
