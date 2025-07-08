-- ~/.config/nvim/lua/plugins/lualine.lua

return {
  {
    "nvim-lualine/lualine.nvim",
    -- nvim-web-devicons 是 Lualine 显示图标的依赖，必须加载
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- 将 Lualine 设为 VeryLazy，以在大部分插件加载完成后再初始化，提高启动速度
    event = "VeryLazy",
    -- opts 函数如果返回一个表格，将完全覆盖 Lualine 的默认配置
    opts = function()
      -- 获取 lazy.nvim 的状态，用于显示待更新插件数量
      local lazy_status = require("lazy.status")

      -- 定义 Lualine 使用的颜色
      local colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        cyan = "#79dac8",
        yellow = "#FFDA7B",
        red = "#FF4A4A",
        fg = "#c3ccdc",
        bg = "#25283a",
        inactive_bg = "#2c3043",
      }

      -- 定义自定义 Lualine 组件函数：Zirs 名称
      local function amnaun()
        return [[Amnaun 🦁]]
      end

      -- 定义自定义 Lualine 组件函数：时钟图标
      local function clockIcon()
        return [[🕐]]
      end

      -- 返回 Lualine 的完整配置表格
      return {
        options = {
          -- 主题：这里强制设为 tokyonight
          theme = "tokyonight",
          -- 组件分隔符
          component_separators = "|",
          -- 区块分隔符（使用了 Nerd Font 图标）
          section_separators = { left = "", right = "" },
          -- 其他选项可以在这里添加，例如 `highlight_inactive_sections = true`
        },
        sections = {
          -- 左侧第一个区块：模式显示
          lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
          },
          -- 左侧第二个区块：文件名、Git 分支
          lualine_b = { "filename", { "branch", icon = "" } },
          -- 中间区块：诊断信息 (LSP 错误/警告)
          lualine_c = { "diagnostics" },
          -- 右侧第三个区块：Lazy 插件更新、文件类型
          lualine_x = {
            {
              -- 显示 Lazy.nvim 待更新插件数量
              lazy_status.updates,
              cond = lazy_status.has_updates, -- 仅当有更新时显示
              -- color = { fg = "#ff9e64" }, -- 如果需要，可以取消注释以设置颜色
            },
            -- { "encoding" }, -- 如果需要，可以取消注释
            -- { "fileformat" }, -- 如果需要，可以取消注释
            { "filetype" }, -- 显示当前文件类型
          },
          -- 右侧第二个区块：自定义 Zirs 名称、进度条
          lualine_y = { amnaun, "progress" },
          -- 右侧第一个区块：时钟图标、当前时间
          lualine_z = {
            { clockIcon, left_padding = 0 },
            { "datetime", style = "%H:%M", separator = { right = "" } },
            -- { "datetime", style = "%H:%M" }, -- 原始配置中的重复项，已删除
          },
        },
        -- 如果你有自定义的非活动窗口、tabline 或扩展配置，也可以在这里添加。
        -- 否则，Lualine 将使用其默认值。
        -- inactive_sections = { ... },
        -- tabline = { ... },
        -- extensions = { ... },
      }
    end,
  },
}
