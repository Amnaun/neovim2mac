local opencode_cmd = "opencode --port"

local opencode_terminal = {
  win = {
    position = "right",
    width = 0.5,
    enter = false,
  },
}

return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      {
        "folke/snacks.nvim",
        optional = true,
        opts = {
          input = {},
          picker = {
            actions = {
              opencode_send = function(...)
                return require("opencode").snacks_picker_send(...)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>oa",
        function()
          require("opencode").ask("@this: ")
        end,
        mode = { "n", "x" },
        desc = "Ask OpenCode",
      },
      {
        "<leader>ox",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "OpenCode actions",
      },
      {
        "<leader>oe",
        function()
          require("opencode").prompt("Explain @this and its context")
        end,
        mode = { "n", "x" },
        desc = "Explain with OpenCode",
      },
      {
        "<leader>of",
        function()
          require("opencode").prompt("Fix @diagnostics")
        end,
        desc = "Fix diagnostics with OpenCode",
      },
      {
        "<leader>or",
        function()
          require("opencode").prompt("Review @diff for correctness and readability")
        end,
        desc = "Review diff with OpenCode",
      },
      {
        "<leader>on",
        function()
          require("opencode").command("session.new")
        end,
        desc = "New OpenCode session",
      },
      {
        "<leader>oi",
        function()
          require("opencode").command("session.interrupt")
        end,
        desc = "Interrupt OpenCode",
      },
      {
        "<leader>oo",
        function()
          require("snacks.terminal").toggle(opencode_cmd, opencode_terminal)
        end,
        mode = { "n", "t" },
        desc = "Toggle OpenCode terminal",
      },
    },
    config = function()
      vim.o.autoread = true
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, opencode_terminal)
          end,
        },
      }
    end,
  },
}
