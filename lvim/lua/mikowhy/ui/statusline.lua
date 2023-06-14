local test = require'lualine.themes.gruvbox'

-- Change the background of lualine_c section for normal mode
test.normal.c.bg = '#ff1100'
-- vim.tbl_extend('keep', lvim.builtin.lualine.sections.lualine_a, { "filename" }) -- to cos kraszuje
lvim.builtin.lualine.sections.lualine_a = { "filename", "mode" }
lvim.builtin.lualine.options.theme = "powerline_dark"
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
lvim.builtin.lualine.options.component_separators = { left = '', right = '' }
-- lvim.builtin.lualine.sections.lualine_b = {lvim.builtin.lualine.utils.bufname(0):sub(1, 10)}
