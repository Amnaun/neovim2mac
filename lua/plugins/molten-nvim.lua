return {
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- ... 其他配置
  end,
}
