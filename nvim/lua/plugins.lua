local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tanvirtin/monokai.nvim",
    "xiyaowong/transparent.nvim",
    "github/copilot.vim",
    {
        "mason-org/mason.nvim",
        opt = {},
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.1.9",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "*",
        opts = {
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
            completion = {
                keyword = { range = "prefix" },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                trigger = { show_on_trigger_character = true },
                documentation = {
                    auto_show = true,
                },
            },
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    }
})

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site"
})

require("nvim-treesitter").install({
    "rust",
    "javascript",
    "c",
    "c++",
    "zig",
    "lua"
})
