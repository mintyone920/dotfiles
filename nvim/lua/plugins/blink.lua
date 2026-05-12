return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",
    opts = {
        cmdline = {
            keymap = {
                ['<Tab>'] = { 'show_and_insert_or_accept_single', 'select_next' },
                ['<S-Tab>'] = { 'show_and_insert_or_accept_single', 'select_prev' },
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'cancel', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },

                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },

                ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
            },
        },
        keymap = {
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'cancel', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                codecompanion = { "codecompanion" },
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
        completion = {
            keyword = { range = "full" },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
            trigger = { show_on_trigger_character = true },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                },
            },
            documentation = {
                auto_show = true,
            },
        },
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}
