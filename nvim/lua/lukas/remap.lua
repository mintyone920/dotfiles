local keymap = require("lukas.keymap")

vim.keymap.set('i', '<C-a>', 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

keymap.nnoremap("<S-Right>", "gt")
keymap.nnoremap("<S-Left>", "gT")

keymap.nnoremap("L", "gt")
keymap.nnoremap("H", "gT")

keymap.nnoremap("<C-Right>", "<C-w>l")
keymap.nnoremap("<C-Up>", "<C-w>k")
keymap.nnoremap("<C-Down>", "<C-w>j")
keymap.nnoremap("<C-Left>", "<C-w>h")

keymap.nnoremap("<C-l>", "<C-w>l")
keymap.nnoremap("<C-k>", "<C-w>k")
keymap.nnoremap("<C-j>", "<C-w>j")
keymap.nnoremap("<C-h>", "<C-w>h")

keymap.nnoremap("<leader>e", "<cmd>Ex<cr>")
keymap.nnoremap("<leader>w", "<cmd>w<cr>")
keymap.nnoremap("<leader>q", "<cmd>q<cr>")

keymap.nnoremap("<leader>p", "\"+p")
keymap.vnoremap("<leader>y", "\"+y")

keymap.nnoremap("<leader>c", "<cmd>cd %:h<cr><cmd>pwd<cr>")

keymap.vnoremap("<leader>/", "y/<C-R>\"<CR>")
keymap.vnoremap("<leader>?", "y?<C-R>\"<CR>")

keymap.nnoremap("<leader>m", function ()
    os.execute("make > /dev/null 2>&1 &")
end)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('v', '<leader>fg', 'y<ESC>:Telescope live_grep default_text=<C-R>\"<CR>')

vim.keymap.set('n', '<leader>z', "<cmd>ClangdSwitchSourceHeader<cr>")
