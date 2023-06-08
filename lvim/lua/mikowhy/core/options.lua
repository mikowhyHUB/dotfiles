local opt = vim.opt -- for concisness

-- line numbers
opt.relativenumber = true
opt.number = true
opt.scrolloff = 7
opt.colorcolumn = "80"

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true --jak szuka / to male i duze litery
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- backsepace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- umozliwia kopiowanie plikow z nvima do systemu

-- split windowis
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

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

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = {}

lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
	".git",
	"package-lock.json",
	"yarn.lock",
	"package.json",
	"requirements.txt",
}
