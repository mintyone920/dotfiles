vim.keymap.set('i', '<C-a>', 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Left>", "<C-w>h")

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")

vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")

vim.keymap.set("v", "<leader>/", "y/<C-R>\"<CR>")
vim.keymap.set("v", "<leader>?", "y?<C-R>\"<CR>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("v", "<leader>fg", "y<ESC>:Telescope live_grep default_text=<C-R>\"<CR>")

vim.keymap.set("n", "<leader>z", "<cmd>LspClangdSwitchSourceHeader<cr>")
vim.keymap.set("n", "<C-a>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

vim.keymap.set("n", "<leader>t", "<cmd>TransparentToggle<cr>")

local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
    local file_path = vim.fn.expand("%:n")

    local list = harpoon:list()
    local found = false

    for idx, item in ipairs(list.items) do
        if item.value == file_path then
            found = true
            break
        end
    end

    if found then
        harpoon:list():remove()
        vim.notify("Removed from harpoon", vim.log.levels.INFO)
    else
        harpoon:list():add()
        vim.notify("Added to harpoon", vim.log.levels.INFO)
    end
end)

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end
vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
{ desc = "Open harpoon window" })

vim.api.nvim_create_user_command('HarpoonClear', function()
  local list = harpoon:list()

  list:clear()
  vim.notify("Harpoon list cleared", vim.log.levels.INFO)
end, {})
