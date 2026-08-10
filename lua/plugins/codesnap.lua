return {
  "mistricky/codesnap.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = {
    "CodeSnap",
    "CodeSnapSave",
    "CodeSnapASCII",
    "CodeSnapHighlight",
    "CodeSnapSaveHighlight",
  },
  opts = {
    show_line_number = true,
    show_workspace = true,
    snapshot_config = {
      theme = "candy",
      code_config = {
        breadcrumbs = {
          enable = true,
          separator = "🌟",
        },
      },
      watermark = {
        content = "Amnaun",
      },
    },
  },
  config = function(_, opts)
    require("codesnap").setup(opts)

    local cpath = vim.split(package.cpath, ";", { plain = true, trimempty = true })
    package.cpath = table.concat(
      vim.tbl_filter(function(path)
        return not path:find("codesnap.nvim/lua/libs", 1, true)
          and not path:find("codesnap.nvim/lua/mac-aarch64_generator.so", 1, true)
      end, cpath),
      ";"
    )
  end,
}
