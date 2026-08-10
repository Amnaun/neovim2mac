return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },
  },
}
