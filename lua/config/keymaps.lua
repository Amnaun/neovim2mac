-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--设置同步全局
vim.keymap.set("i", "jk", "<Esc>", { silent = true, noremap = true })

--设置最上面是shift+l
vim.keymap.set(
  { "n", "v" }, -- {'n', 'v'} 表示在 Normal 和 Visual 模式下都生效
  "P", -- 'L' 代表 Shift + l
  "gg", -- 要执行的命令
  { noremap = true, silent = true, desc = "Go to first line" }
)

local function focus_switchable_window()
  if not vim.wo.winfixbuf then
    return true
  end

  local current = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if win ~= current and vim.api.nvim_win_is_valid(win) then
      local ok, winfixbuf = pcall(vim.api.nvim_get_option_value, "winfixbuf", { win = win })
      local config = vim.api.nvim_win_get_config(win)
      if ok and not winfixbuf and config.relative == "" then
        vim.api.nvim_set_current_win(win)
        return true
      end
    end
  end

  vim.notify("当前窗口固定了 buffer，不能在这里切换 buffer", vim.log.levels.WARN)
  return false
end

local function cycle_buffer(direction)
  if not focus_switchable_window() then
    return
  end

  local ok, bufferline = pcall(require, "bufferline")
  if ok then
    bufferline.cycle(direction)
  elseif direction > 0 then
    vim.cmd.bnext()
  else
    vim.cmd.bprevious()
  end
end

vim.keymap.set("n", "<S-h>", function()
  cycle_buffer(-1)
end, { silent = true, desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", function()
  cycle_buffer(1)
end, { silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "[b", function()
  cycle_buffer(-1)
end, { silent = true, desc = "Prev Buffer" })
vim.keymap.set("n", "]b", function()
  cycle_buffer(1)
end, { silent = true, desc = "Next Buffer" })

--设置CompetiTest插件
vim.keymap.set("n", "1a", ":CompetiTest add_testcase<CR>", { silent = true, noremap = true, desc = "Add testcase" })
vim.keymap.set("n", "1e", ":CompetiTest edit_testcase<CR>", { silent = true, noremap = true, desc = "Edit testcase" })
vim.keymap.set(
  "n",
  "1d",
  ":CompetiTest delete_testcase<CR>",
  { silent = true, noremap = true, desc = "Delete testcase" }
)
vim.keymap.set("n", "1r", ":CompetiTest run<CR>", { silent = true, noremap = true, desc = "Run testcases" })
vim.keymap.set(
  "n",
  "1R",
  ":CompetiTest run_no_compile<CR>",
  { silent = true, noremap = true, desc = "Run without compile" }
)
vim.keymap.set("n", "1u", ":CompetiTest show_ui<CR>", { silent = true, noremap = true, desc = "Show testcase UI" })
vim.keymap.set("n", "1t", ":CompetiTest receive testcases<CR>", { silent = true, desc = "Receive testcases" })
vim.keymap.set("n", "1c", ":CompetiTest receive contest<CR>", { silent = true, desc = "Receive contest" })
vim.keymap.set("n", "1p", ":CompetiTest receive problem<CR>", { silent = true, desc = "Receive problem" })
vim.keymap.set("n", "1s", ":CompetiTest receive status<CR>", { silent = true, desc = "Receive status" })
vim.keymap.set("n", "1x", ":CompetiTest receive stop<CR>", { silent = true, desc = "Stop receiving" })

--设置LeetCode插件
vim.keymap.set("n", "<leader>ll", ":Leet<CR>", { silent = true, desc = "LeetCode menu" })
vim.keymap.set("n", "<leader>lr", ":Leet run<CR>", { silent = true, desc = "LeetCode run" })
vim.keymap.set("n", "<leader>ls", ":Leet submit<CR>", { silent = true, desc = "LeetCode submit" })
vim.keymap.set("n", "<leader>ld", ":Leet daily<CR>", { silent = true, desc = "LeetCode daily" })
vim.keymap.set("n", "<leader>lo", ":Leet open<CR>", { silent = true, desc = "Open LeetCode problem" })

--设置molten插件
vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "初始化插件" })

vim.keymap.set("n", "<leader>re", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "运行操作符选择" })

vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "运行当前行" })

vim.keymap.set(
  "v",
  "<leader>rv",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "运行可视选中区域" }
)

--设置CodeSnap插件
vim.keymap.set("v", "<leader>cs", ":CodeSnap<CR>", { silent = true, desc = "CodeSnap" })

--设置Neovide全屏
local function neovide_toggle_fullscreen()
  if vim.g.neovide_fullscreen then
    vim.g.neovide_fullscreen = false
  else
    vim.g.neovide_fullscreen = true
  end
end

vim.keymap.set("n", "<F10>", neovide_toggle_fullscreen, { silent = true, desc = "Toggle Neovide fullscreen" })
