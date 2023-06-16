local lvim_lsp = require('lvim.lsp')
-- local ts = require('typescript')

-- jesli chcesz manualnie skonfigurowac server to dajesz linikje ponizej
-- nastepnie jak ustawisz to komenda: :LSPCacheReset
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "typescript"})
--configur tsserver serve manually.

local common_on_attach = lvim_lsp.common_on_attach
local common_capabilities = lvim_lsp.common_capabilities()

lvim.lsp.on_attach_callback = function(client, bufnr)
  if lvim.colorscheme == 'gruvbox' then
    -- change coloring of errors so I can actually read them with gruvbox
    vim.cmd(':hi DiagnosticError guifg=#de5b64 guibg=#1C1C1C')
    vim.cmd(':hi DiagnosticWarn guifg=DarkOrange ctermfg=DarkYellow')
    vim.cmd(':hi DiagnosticInfo guifg=Cyan ctermfg=Cyan')
    vim.cmd(':hi DiagnosticHint guifg=White ctermfg=White')
  end
end

--proba configu pyright
local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "basic", -- off, basic, strict || jak robimy off to czerwone errory wylaczamy
        useLibraryCodeForTypes = true
      }
    }
  },
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)
-- test z yt: https://www.youtube.com/watch?v=LPrv2q2L73Q ~doesnt work
local opts= {}
require("lvim.lsp.manager").setup("autopep8", opts)

-- Typescript config using typescript.nvim
-- ts.setup({
--   server = {
--     root_dir = require('lspconfig.util').root_pattern('.git'),
--     capabilities = common_capabilities,
--     on_attach = common_on_attach,
--   },
-- })

-- -- Keeping this here for reference
-- require("lvim.lsp.manager").setup("tsserver", {
--   root_dir = require('lspconfig.util').root_pattern('.git'),
--   on_attach = common_on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
--   cmd = {
--     "typescript-language-server",
--     "--stdio",
--   },
-- })
--
-- ustawienia formateraa

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettierd",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "json",
    }
  },
{
    command = "autopep8",
    filetypes = {
        "python",
    }
    }
})

local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "eslint_d",
    filetypes = { "javascript", "typescript", "typescriptreact", "json" }
  },
})

-- lvim.lsp.diagnostics.float.max_width = 120
-- lvim.lsp.diagnostics.float.focusable = true

-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
