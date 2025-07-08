-- ~/.config/nvim/lua/plugins/trouble.lua

return {
  "folke/trouble.nvim",
  -- 根据你原始配置的意图，这里删除了 enabled = false 的冲突行
  -- 如果你真的想禁用 trouble.nvim，请将 opts = { use_diagnostic_signs = true } 替换为 enabled = false
  opts = { use_diagnostic_signs = true },
}
