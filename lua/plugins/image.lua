return {
  "3rd/image.nvim",
  cond = not vim.g.neovide, -- 只在非 Neovide 环境下加载
  opts = {
    backend = "kitty",
    processor = "magick_cli",
    integrations = {
      markdown = {
        enabled = true,
      },
    },
  },
}
