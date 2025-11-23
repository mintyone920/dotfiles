vim.keymap.set('i', '<C-a>', 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

vim.keymap.set("n", "<S-Right>", "gt")
vim.keymap.set("n", "<S-Left>", "gT")

vim.keymap.set("n", "L", "gt")
vim.keymap.set("n", "H", "gT")

vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Left>", "<C-w>h")

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")

vim.keymap.set("v", "<leader>/", "y/<C-R>\"<CR>")
vim.keymap.set("v", "<leader>?", "y?<C-R>\"<CR>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("v", "<leader>ff", "y<ESC>:Telescope live_grep default_text=<C-R>\"<CR>")

vim.keymap.set("n", "<leader>z", "<cmd>ClangdSwitchSourceHeader<cr>")

vim.keymap.set("n", "<leader>t", "<cmd>TransparentToggle<cr>")
