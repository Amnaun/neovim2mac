-- ~/.config/nvim/lua/config/options.lua

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 设置剪贴板行为
vim.opt.clipboard = "unnamedplus"

-- =======================================================
-- Neovide 专属配置
-- 这些配置只在 Neovide GUI 运行时生效
-- =======================================================

-- 确保字体设置正确且格式正确
-- 如果 'Maple Mono NF CN' 字体未安装或名称不完全匹配，这仍可能导致问题
-- 请务必在 macOS 字体册中核对字体名称，并确保是 Nerd Font 版本
vim.o.guifont = "Maple Mono NF CN:h24"

-- Neovide VFX (视觉效果) 配置
vim.g.neovide_cursor_vfx_mode = "sonicboom" -- 设置光标VFX主题
vim.g.neovide_cursor_vfx_opacity = 100 -- 降低粒子不透明度 (0-255)，让它们不那么显眼
vim.g.neovide_refresh_rate = 60 -- 设置刷新率
vim.g.neovide_cursor_vfx_particle_size = 2.0 -- 设置光标粒子大小
vim.g.neovide_cursor_vfx_particle_lifetime = 3500 -- **关键：将生命周期从 3500ms 降到 500ms (0.5 秒)**
vim.g.neovide_cursor_vfx_particle_speed = 2.5 -- 粒子扩散速度

-- Neovide 缩放因子（用于动态调整字体大小）
vim.g.neovide_scale_factor = 0.7 -- 初始缩放比例

-- 绑定键盘快捷键用于动态调整字体大小
vim.api.nvim_set_keymap(
  "n",
  "<C-ScrollWheelUp>",
  [[<Cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>]],
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-ScrollWheelDown>",
  [[<Cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>]],
  { silent = true, noremap = true }
)

-- 设置窗口透明度和毛玻璃效果
-- 根据 Neovide 新版本提示，使用 'neovide_opacity' 来设置透明度
vim.g.neovide_opacity = 0.75 -- 0.0 完全透明, 1.0 完全不透明

-- 启用背景模糊（毛玻璃效果），并设置模糊半径
--vim.g.neovide_transparency_blur_radius = 1.0 -- 模糊半径，值越大模糊越强，可以尝试 0.5 到 2.0
vim.g.neovide_window_blurred = false -- 启用模糊效果（这个开关应该配合 radius 一起用）

-- 其他 Neovide 特有配置（如果需要）
-- vim.g.neovide_floating_blur = false -- 禁用浮动窗口模糊
-- vim.g.neovide_theme = "auto" -- 自动根据系统主题切换亮/暗模式

-- `avante_host_mount` 看起来像是一个特定于某个插件（如 Avante）的变量，如果不是，通常不需要
-- 如果它与 Neovide 或 Neovim 的核心功能无关，建议删除或确认其用途
vim.g.avante_host_mount = "/" -- 允许访问根目录 (如果确定需要)

-- =======================================================
-- 通用 Neovim 配置 (与 GUI/CLI 都相关)
-- =======================================================

-- 设置退出 Neovim 时光标形状（避免有时退出后光标形状不恢复）
vim.api.nvim_create_autocmd({ "ExitPre" }, {
  callback = function()
    vim.opt.guicursor = "a:ver30-blinkon1-blinkoff250-blinkwait10"
  end,
})

-- 设置高光组（这些高光组可能被你的主题覆盖，具体效果取决于主题）
vim.api.nvim_set_hl(0, "Function", { fg = "#FF00FF", bold = true }) -- 函数名发光
vim.api.nvim_set_hl(0, "Keyword", { fg = "#00FFFF", italic = true }) -- 关键字发光
