return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "BufReadPost",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      auto_trigger = false,
      keymap = {
        accept = false,
      },
    },
    panel = {
      enabled = false,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    vim.g.ai_accept = function()
      local suggestion = require("copilot.suggestion")
      if suggestion.is_visible() then
        suggestion.accept()
        return true
      end
      return false
    end
    vim.keymap.set("i", "<C-k>", function()
      return vim.g.ai_accept() and "" or "\t"
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<C-y>", function()
      return vim.g.ai_accept() and "" or "\t"
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<S-Tab>", function()
      return "\t"
    end, { expr = true, silent = true })
  end,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            ai_accept = function()
              local suggestion = require("copilot.suggestion")
              if suggestion.is_visible() then
                suggestion.accept()
                return true
              end
              return false
            end,
          },
        },
      },
    },
  },
}
