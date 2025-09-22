return {
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
    "3rd/image.nvim", -- 确保 image.nvim 在这里
  },
  config = function()
    -- ... 其他配置
    vim.g.molten_image_provider = "image.nvim"
  end,
}
