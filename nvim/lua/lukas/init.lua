require("lukas.set")
require("lukas.packer")
require("lukas.remap")
require("lukas.treesitter")
require("lukas.lsp")


require("lualine").setup({
    options = {
        icons_enabled = false,
        section_separators = "",
    }
})

require("transparent").setup()

require("Comment").setup()

require("telescope").setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        -- ..
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
})

require("remember").setup {
    open_folds = true,
}

require("monokai").setup({
    palette = require("monokai").pro
})
