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

--设置CompetiTese插件
vim.keymap.set("n", "1a", ":CompetiTest add_testcase<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "1e", ":CompetiTest edit_testcase<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "1d", ":CompetiTest delete_testcase<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "1r", ":CompetiTest run<CR>", { silent = true, noremap = true })

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
vim.api.nvim_set_keymap("v", "<leader>cs", ":CodeSnap<CR>", { noremap = true, silent = true })

--设置Neovide全屏
function NeovideToggleFullScreen()
  if vim.g.neovide_fullscreen then
    vim.g.neovide_fullscreen = false
  else
    vim.g.neovide_fullscreen = true
  end
end

vim.api.nvim_set_keymap("n", "<F10>", ":lua NeovideToggleFullScreen()<CR>", { silent = true, noremap = true })
