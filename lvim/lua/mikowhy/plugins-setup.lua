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
    -- { cos jak presistacne ale nie dzial chuj
    --     'rmagatti/auto-session',
    --     config = function()
    --         require("auto-session").setup {
    --             log_level = "error",
    --             auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    --             cwd_change_handling = {
    --                 restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
    --                 pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
    --                 post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
    --                     require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
    --                 end,
    --             }
    --         }
    --     end
    -- },
    -- gdy jakis blad masz to szybko fixuje te bledy
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    },

    { "tpope/vim-surround" }, -- automatyczne zamykanie nawiasow itp
    -- { "felipec/vim-sanegx", event = "BufRead" }, -- otwiera url (gx). Moze kiedys sie przyda
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    { "tpope/vim-repeat" }, -- cos robi z pluginami jak sie kropke nacisnie

    -- { "ThePrimeagen/harpoon" },

    -- { -- poruszanie sie po slowach
    --   'phaazon/hop.nvim',
    --   branch = 'v2',
    --   config = function()
    --     require('hop').setup()
    --   end
    -- },
    { "kkharji/sqlite.lua" }, -- potrzebny do frecency
    {
        --inteligentne szukanie plikow/tekstow
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
    },
    -- use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion) z nvima. cos z kopiowaniem but dunno

    --   {
    --     'AckslD/nvim-trevJ.lua',
    --     config = 'require("trevj").setup()',
    --     init = function()
    --       vim.keymap.set('n', '<leader>j', function()
    --         require('trevj').format_at_cursor()
    --       end)
    --     end,
    --   },
    -- }
    -- nvim v0.7.2
    -- { doesnt work
    --     "kdheepak/lazygit.nvim",
    --     -- optional for floating window border decoration
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --     },
    -- },

    table.insert(lvim.plugins, {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            local ok, cmp = pcall(require, "copilot_cmp")
            if ok then cmp.setup({}) end
        end,
    }),

    lvim.builtin.telescope.on_config_done == function(telescope)
        pcall(telescope.load_extension, "frecency")
    end
}
