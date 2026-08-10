-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  -- Nvim-treesitter 配置
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- C/C++ 的 treesitter indent 目前容易在函数体里误缩进，交给 ftplugin/cindent 处理。
      -- LazyVim 这里的 disable 只按 table 判断，所以不要写成 function。
      opts.indent = opts.indent or {}
      opts.indent.disable = opts.indent.disable or {}
      for _, lang in ipairs({ "c", "cpp" }) do
        if not vim.tbl_contains(opts.indent.disable, lang) then
          table.insert(opts.indent.disable, lang)
        end
      end

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
