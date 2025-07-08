-- lua/plugins/lsp.lua
return {
  -- 导入 LazyVim 为常用语言准备好的所有“全家桶”配置
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.rust" }, -- 如果你需要 Rust
  { import = "lazyvim.plugins.extras.lang.python" },
  --{ import = "lazyvim.plugins.extras.lang.cpp" }, -- LazyVim 对 C++ 的支持可能需要额外配置，但先导入
  -- ... 你需要的其他语言 ...
}
