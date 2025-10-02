return {
  "3rd/image.nvim",
  cond = not vim.g.neovide,
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
