lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"vue",
	"css",
	"rust",
	"pug",
	"yaml",
}


-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = false
lvim.format_on_save.pattern = { "*.py" }
formatters.setup { {name = "prettierd" }, }
-- -- setup linting
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { {  name = "pyflakes" },  }


require("nvim-treesitter.configs").setup {
  yati = {
    enable = true,
    -- Disable by languages, see `Supported languages`
    disable = { "lua", "vue" },

    -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
    default_lazy = true,

    -- Determine the fallback method used when we cannot calculate indent by tree-sitter
    --   "auto": fallback to vim auto indent
    --   "asis": use current indent as-is
    --   "cindent": see `:h cindent()`
    -- Or a custom function return the final indent result.
    default_fallback = "auto"
  },
  indent = {
    enable = false -- disable builtin indent module
  }
}
