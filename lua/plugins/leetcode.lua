local leet_arg = "leetcode.nvim"

return {
  "kawre/leetcode.nvim",
  lazy = leet_arg ~= vim.fn.argv(0, -1),
  cmd = "Leet",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    arg = leet_arg,
    lang = "cpp",
    cn = {
      enabled = true,
      translator = true,
      translate_problems = true,
    },
    plugins = {
      non_standalone = true,
    },
    picker = {
      provider = "telescope",
    },
    description = {
      position = "left",
      width = "40%",
      show_stats = true,
    },
    console = {
      open_on_runcode = true,
      dir = "row",
      size = {
        width = "90%",
        height = "75%",
      },
    },
    image_support = false,
  },
}
