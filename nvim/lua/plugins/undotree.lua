return {
  "jiaoshijie/undotree",
  opts = {
    -- your options
    keymaps = {
        ["<Up>"] = "move_prev",
        ["<Down>"] = "move_next",
    }
  },
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
