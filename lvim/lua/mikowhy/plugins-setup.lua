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

    {
        -- wyswietla wszystkie bledy w pliku
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },

    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end
    },

    -- przywraca poprzednia sesje
    {
        "folke/persistence.nvim",
        -- event = "BufReadPre",
        config = function()
            require("persistence").setup({
                dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
                options = { "buffers", "curdir", "tabpages", "winsize" }
            })
        end
    },
    -- gdy jakis blad masz to szybko fixuje te bledy
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    },

    { "tpope/vim-surround" },     -- automatyczne zamykanie nawiasow itp
    -- { "felipec/vim-sanegx", event = "BufRead" },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    -- { "tpope/vim-repeat" },

    -- { "ThePrimeagen/harpoon" },

    -- { -- poruszanie sie po slowach
    --   'phaazon/hop.nvim',
    --   branch = 'v2',
    --   config = function()
    --     require('hop').setup()
    --   end
    -- },

    {
        --inteligentne szukanie plikow/tekstow
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
    },

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
