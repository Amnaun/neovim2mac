-- ~/.config/nvim/lua/plugins/mason-tools.lua

return {
  -- Mason 配置：安装命令行工具
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb", -- 调试器
        "stylua", -- Lua 格式化工具
        "shellcheck", -- Shell 脚本静态分析工具
        "shfmt", -- Shell 脚本格式化工具
        "flake8", -- Python 代码风格检查
        "black", -- Python 格式化工具
        "isort", -- Python import 排序
        "clang-format", -- C/C++/Java fallback 格式化工具
        "prettierd", -- JS/TS/JSON/YAML/Markdown 格式化工具
        "google-java-format", -- Java 格式化工具
        -- 添加其他你希望 Mason 安装的工具
      },
    },
  },
}
