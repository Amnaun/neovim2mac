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
if vim.g.neovide then
  vim.o.guifont = "Maple Mono NF CN:h24"

  -- Neovide VFX (视觉效果) 配置
  vim.g.neovide_cursor_vfx_mode = "sonicboom" -- 设置光标VFX主题
  vim.g.neovide_cursor_vfx_opacity = 100 -- 降低粒子不透明度 (0-255)，让它们不那么显眼
  vim.g.neovide_refresh_rate = 60 -- 设置刷新率
  vim.g.neovide_cursor_animation_length = 0.06 --设置动画速度(上下)
  vim.g.neovide_cursor_short_animation_length = 0.03 --设置短动画速度(左右)
  vim.g.neovide_cursor_vfx_particle_size = 2.0 -- 设置光标粒子大小
  vim.g.neovide_cursor_vfx_particle_lifetime = 1500 -- 粒子生命周期
  vim.g.neovide_cursor_vfx_particle_speed = 10 -- 粒子扩散速度
  vim.g.neovide_bloom_enabled = true --  启用辉光效果
  vim.g.neovide_bloom_intensity = 0.15 -- 辉光强度

  -- Neovide 缩放因子（用于动态调整字体大小）
  vim.g.neovide_scale_factor = 0.7 -- 初始缩放比例

  -- 绑定键盘快捷键用于动态调整字体大小
  vim.keymap.set("n", "<C-ScrollWheelUp>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end, { silent = true, desc = "Increase Neovide scale" })
  vim.keymap.set("n", "<C-ScrollWheelDown>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end, { silent = true, desc = "Decrease Neovide scale" })

  -- 设置窗口透明度和毛玻璃效果
  vim.g.neovide_opacity = 0.75 -- 0.0 完全透明, 1.0 完全不透明
  vim.g.neovide_window_blurred = false -- 启用模糊效果
  vim.g.neovide_show_border = false --显示边框
end

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
