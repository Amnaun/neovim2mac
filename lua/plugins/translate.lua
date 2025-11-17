-- ~/.config/nvim/lua/plugins/localdict.lua

-- 漂亮浮动窗口
local function create_floating_win(lines, title)
  local max_len = 0
  for _, l in ipairs(lines) do
    local len = vim.fn.strdisplaywidth(l)
    if len > max_len then
      max_len = len
    end
  end

  local width = math.min(max_len + 4, math.floor(vim.o.columns * 0.7))
  local height = math.min(#lines + 2, math.floor(vim.o.lines * 0.5))
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "modifiable", true)
  vim.api.nvim_buf_set_option(buf, "filetype", "localdict")

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)

  local win = vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    border = "rounded",
    row = row,
    col = col,
    width = width,
    height = height,
    title = title,
    title_pos = "center",
  })

  local function close()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end
  vim.keymap.set("n", "q", close, { buffer = buf, nowait = true })
  vim.keymap.set("n", "<Esc>", close, { buffer = buf, nowait = true })

  return win
end

-- 当前 Neovim 会话里的查词缓存
local localdict_cache = {}

local function get_visual_or_cword()
  local mode = vim.fn.mode()
  local text = ""

  if mode == "v" or mode == "V" then
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])

    if #lines > 0 then
      lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
      lines[1] = string.sub(lines[1], start_pos[3])
      text = table.concat(lines, " ")
    end
  else
    text = vim.fn.expand("<cword>")
  end

  return text
end

local function lookup_local_dict()
  local text = get_visual_or_cword()
  if text == nil or text == "" then
    return
  end

  -- 1. 先查缓存
  if localdict_cache[text] then
    create_floating_win(localdict_cache[text], "📚 本地词典: " .. text)
    return
  end

  -- 2. 调用 sdcv 查询本地词典（非交互模式）
  local cmd = "sdcv -n --utf8-input --utf8-output " .. vim.fn.shellescape(text)
  local ok, result = pcall(vim.fn.systemlist, cmd)
  if not ok or not result or #result == 0 then
    vim.notify("本地词典查询失败（sdcv 调用错误）", vim.log.levels.ERROR)
    return
  end

  local joined = table.concat(result, "\n")
  -- sdcv 查不到时：中文版本一般会有“没有发现”，英文会有“Nothing similar”
  if joined:match("没有发现") or joined:match("Nothing similar") or joined:match("Found 0 items") then
    vim.notify("本地词典中未找到: " .. text, vim.log.levels.WARN)
    return
  end

  -- 简单美化：突出不同词典
  for i, l in ipairs(result) do
    l = l:gsub("懒虫简明英汉词典", "📕 懒虫简明英汉词典")
    l = l:gsub("朗道英汉字典5%.0", "📘 朗道英汉字典5.0")
    result[i] = l
  end

  -- 写入缓存
  localdict_cache[text] = result

  -- 显示漂亮浮窗
  create_floating_win(result, "📚 本地词典: " .. text)
end

return {
  {
    "uga-rosa/translate.nvim",
    lazy = false,
    config = function()
      require("translate").setup({
        default = {
          command = "google",
        },
      })
    end,
    keys = {
      -- 本地词典 + 缓存 + 漂亮 UI
      {
        "<leader>tt",
        lookup_local_dict,
        mode = { "n", "v" },
        desc = "📚 本地词典查词（带缓存）",
      },
      -- 纯在线翻译（需要时手动用）
      {
        "<leader>tr",
        "<Cmd>Translate ZH -output=floating<CR>",
        mode = { "n", "x" },
        desc = "🌐 在线翻译（Google）",
      },
    },
  },
}
