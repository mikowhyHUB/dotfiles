local opt = vim.opt -- for concisness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4               
opt.shiftwidth = 2 
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
opt.background = "dark"
opt.signcolumn = "yes"

-- backsepace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- umozliwia kopiowanie plikow z nvima do systemu

-- split windowis
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

