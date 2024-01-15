local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"

    use "nvim-lualine/lualine.nvim"
    use "arcticicestudio/nord-vim"
    use "tanvirtin/monokai.nvim"
    use "xiyaowong/nvim-transparent"
    use "rebelot/kanagawa.nvim"

    use "numToStr/Comment.nvim"
    use "nvim-telescope/telescope.nvim"
    use "vladdoster/remember.nvim"

    use "nvim-treesitter/nvim-treesitter"
    use { "nvim-treesitter/nvim-treesitter-textobjects", after = { "nvim-treesitter" } }

    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"

    use "github/copilot.vim"

    if is_bootstrap then
        require('packer').sync()
    end
end)
