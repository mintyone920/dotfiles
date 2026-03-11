return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "size",
                "mtime",
            },
            keymaps = {
                ["<Esc>"] = { "actions.close" },
            },
        })
    end,
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
}
