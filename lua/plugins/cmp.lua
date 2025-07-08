-- ~/.config/nvim/lua/plugins/cmp.lua

return {
  -- 覆盖 nvim-cmp 配置并添加 cmp-emoji 源
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
