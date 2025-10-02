-- ~/.config/nvim/init.lua
vim.g.lazyvim_check_order = false
require("config.lazy")

-- 配置conda环境
-- 1. 定义一个 Lua 函数，用于执行 Shell 命令并返回结果
local function get_conda_python_path()
  -- 尝试执行 'which python' 命令
  local handle = io.popen("which python")
  if handle then
    local path = handle:read("*l")
    handle:close()
    -- 确保路径包含 "envs" (Conda环境的常见特征)
    if path and path:find("envs") then
      -- 返回清理后的路径（去除末尾的换行符/空格）
      return path:gsub("^%s*(.-)%s*$", "%1")
    end
  end
  -- 如果不在 Conda 环境中，则返回 nil 或系统默认路径
  return nil
end

-- 2. 在配置中调用函数并设置变量
local conda_path = get_conda_python_path()

if conda_path then
  -- 如果找到 Conda 路径，则使用它
  vim.g.python3_host_prog = conda_path
else
  -- 否则，让它保持未设置或设置为系统默认（让 nvim 自行查找）
  -- 这样可以避免在非 Conda 终端中启动 nvim 时出错
  print("未检测到 Conda 环境，使用默认 Python Provider 查找。")
end
