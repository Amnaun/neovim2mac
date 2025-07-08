-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  -- Nvim-treesitter 配置
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- `vim.list_extend` 会将新的解析器添加到现有的 ensure_installed 列表中
      -- 如果你希望完全替换默认列表，可以注释掉下面这行，然后直接赋值：
      -- opts.ensure_installed = { "cpp", "bash", ... }
      vim.list_extend(opts.ensure_installed, {
        "cpp",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        -- 添加其他你需要的解析器
      })
    end,
  },
}
