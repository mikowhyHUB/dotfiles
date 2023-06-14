local kind = require('mikowhy.ui.kind')

lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
vim.keymap.set('n', 'gn', ":tabe %<CR>") --new tab
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set('n', '<leader>lA', ":CodeActionMenu<CR>") --new tab

-- navigate within insert mode
lvim.keys.insert_mode["<C-b>"] = "<ESC>^i"
lvim.keys.insert_mode["<C-n>"] = "<ESC>$" -- nie dziala

lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
lvim.keys.insert_mode["<C-j>"] = "<Down>"
lvim.keys.insert_mode["<C-k>"] = "<Up>"

-- w visual mode mozessz przesuwac zaznaczone linie gora dol
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- PLUGIN KEYMAPS
-- pokazuje kazde miejsce gdzie slowo pod kursorem sie znajduje
lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
  kind.cmp_kind.Reference .. " Find references"
}
-- pokazuje definicje pod kursorem
lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  ":lua vim.lsp.buf.definition()<cr>",
  -- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
  kind.cmp_kind.Reference .. " Definitions"
}

lvim.lsp.buffer_mappings.normal_mode["gD"] = {
  ":lua vim.lsp.buf.type_definition()<cr>",
  kind.cmp_kind.Reference .. " Type Definition"
}
-- nie dziala
lvim.lsp.buffer_mappings.normal_mode["gf"] = {
  ":Telescope frecency<cr>",
  kind.cmp_kind.Reference .. " Telescope Frecency"
}

lvim.keys.normal_mode['<leader>c'] = require('osc52').copy_operator
-- vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
lvim.keys.visual_mode['<leader>c'] = require('osc52').copy_visual
