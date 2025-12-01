return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.config")

        configs.setup({
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "python",
                "html",
                "css",
                "javascript",
                "json",
                "bash"
            },
            highlight = {
                enable = true,
                disable = "",
            },
            autopairs = {
                enable = true,
            },
            indent = {
                enable = false,
                disable = {},
            },
        })
    end,
}
