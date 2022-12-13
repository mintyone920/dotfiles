local keymap = require("lukas.keymap")

keymap.nnoremap("<S-Right>", "gt")
keymap.nnoremap("<S-Left>", "gT")

keymap.nnoremap("<C-Right>", "<C-w>l")
keymap.nnoremap("<C-Up>", "<C-w>k")
keymap.nnoremap("<C-Down>", "<C-w>j")
keymap.nnoremap("<C-Left>", "<C-w>h")

keymap.nnoremap("<leader>e", "<cmd>Ex<cr>")
keymap.nnoremap("<leader>w", "<cmd>w<cr>")
keymap.nnoremap("<leader>q", "<cmd>q<cr>")

keymap.nnoremap("<leader>p", "\"+p")
keymap.vnoremap("<leader>y", "\"+y")

keymap.nnoremap("<C-l>", "<C-w>l")
keymap.nnoremap("<C-k>", "<C-w>k")
keymap.nnoremap("<C-j>", "<C-w>j")
keymap.nnoremap("<C-h>", "<C-w>h")
