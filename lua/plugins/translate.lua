return {
  "uga-rosa/translate.nvim",
  cmd = { "Translate" },
  -- 懒加载：用到命令或按键时才加载
  keys = {
    -- 普通模式：翻译当前行到中文，用浮动窗口显示
    {
      "<leader>tt",
      "<Cmd>Translate ZH -output=floating<CR>",
      mode = "n",
      desc = "Translate line to Chinese",
    },
    -- 可视模式：翻译选中内容到中文，用浮动窗口显示
    {
      "<leader>tt",
      "<Cmd>Translate ZH -output=floating<CR>",
      mode = "x",
      desc = "Translate selection to Chinese",
    },
  },
  config = function()
    require("translate").setup({
      -- 默认就用 google，这里显式写一下
      default = {
        command = "google",
      },
      -- 其他高级配置以后再折腾也行，先默认够用
    })
  end,
}
