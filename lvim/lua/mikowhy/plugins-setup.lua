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
    { -- kopiowanie
        "ojroques/nvim-osc52"
    },

    {	-- historia zmian
        "mbbill/undotree"
    },

    -- przywraca poprzednia sesje
    -- { -- wywala blad a jez z lunar.com
    --   "folke/persistence.nvim",
    --     event = "BufReadPre", -- this will only start session saving when an actual file was opened
    --     module = "persistence",
    --     config = function()
    --       require("persistence").setup {
    --         dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
    --         options = { "buffers", "curdir", "tabpages", "winsize" },
    --       }
    --   end,
    -- },
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