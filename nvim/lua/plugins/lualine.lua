return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require("lualine").setup({
            sections = {
                lualine_x = {
                    {
                        function()
                            local harpoon = require("harpoon")
                            local list = harpoon:list()
                            local absolute_path = vim.fn.expand("%:p")
                            local cwd = vim.fn.getcwd()
                            local file_path = absolute_path:sub(#cwd + 2)

                            for idx, item in ipairs(list.items) do
                                if item.value == file_path then
                                    return "Harpoon: " .. idx
                                end
                            end

                            return ""
                        end,
                        color = { fg = "#ff9e64" }
                    },
                    'filetype'
                },
            },
            })
            end
        }
