-- ~/.config/nvim/lua/plugins/mason-tools.lua

return {
  -- Mason 配置：安装命令行工具
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb", -- 调试器
        "stylua", -- Lua 格式化工具
        "shellcheck", -- Shell 脚本静态分析工具
        "shfmt", -- Shell 脚本格式化工具
        "flake8", -- Python 代码风格检查
        -- 添加其他你希望 Mason 安装的工具
      },
    },
  },
}
