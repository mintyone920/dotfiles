local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local lsp_flags = {
    debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function on_attach(client, bufnr)

    local opts = {buffer = true}
    local function nnoremap(lhs, rhs)
        require("lukas.keymap").nnoremap(lhs, rhs, opts)
    end
    local function xnoremap(lhs, rhs)
        require("lukas.keymap").xnoremap(lhs, rhs, opts)
    end
    nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    nnoremap("go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    nnoremap("gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

    -- Displays a function"s signature information
    nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    -- Selects a code action available at the current cursor position
    nnoremap("<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    xnoremap("<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

    -- Show diagnostics in a floating window

    -- Move to the previous diagnostic
    nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

    -- Move to the next diagnostic
    nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
end

local luasnip = require("luasnip")
local cmp = require("cmp")
if cmp then
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-f>'] = cmp.mapping.scroll_docs(-4),
            ['<C-h>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        sources = {
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },

        }
    })
end

local lua_root_files = {
    ".luarc.json",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
}

lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    cmd = {"lua-language-server"},
    filetypes = {"lua"},
    root_dir = function(fname)
      local root = util.root_pattern(unpack(lua_root_files))(fname) or util.root_pattern 'lua/'(fname)
      if root and root ~= vim.env.HOME then
        return root
      end
      return util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                    "signals",
                    "get",
                    "get_value",
                    "publish",
                    "sleep",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    },
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes =  {"rust"},
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                allTargets = false
            }
        }
    }
})

lspconfig.pylsp.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    require("lspconfig.server_configurations.pylsp"),
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLenght = 120
                }
            }
        }
    }
})

lspconfig.zls.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    default_config = {
        cmd = { 'zls' },
        filetypes = { 'zig', 'zir' },
        root_dir = util.root_pattern('zls.json', '.git'),
        single_file_support = true,
    },
    docs = {
        description = [[
https://github.com/zigtools/zls
Zig LSP implementation + Zig Language Server
        ]],
        default_config = {
            root_dir = [[util.root_pattern("zls.json", ".git")]],
        },
    },
})

lspconfig.texlab.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    require("lspconfig.server_configurations.texlab"),
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    require("lspconfig.server_configurations.clangd"),
})
