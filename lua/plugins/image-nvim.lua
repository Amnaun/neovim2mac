return {
  "3rd/image.nvim",
  cond = function()
    return not vim.g.neovide and #vim.api.nvim_list_uis() > 0
  end,
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
