-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  -- 配置 telescope 选项并添加一个浏览插件文件的快捷键
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- 添加一个快捷键来浏览插件文件
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- 更改一些默认选项
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
