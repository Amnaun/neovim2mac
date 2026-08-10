-- C++ indentation: use Vim's built-in cindent instead of treesitter indent.
-- Treesitter indentation for C/C++ is still experimental and can misindent
-- after function-opening braces in some buffers.
vim.bo.indentexpr = ""
vim.bo.cindent = true
vim.bo.smartindent = false
vim.bo.autoindent = true

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
