-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "folke/todo-comments.nvim",
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>xt"] = { "<cmd>TodoTelescope<cr>", desc = "Open Todos in Telescope" },
          ["<Leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "Open Todos in Trouble" },
          ["<Leader>xQ"] = { "<cmd>TodoQuickFix<cr>", desc = "Quickfix List (Todo)" },
          ["<Leader>xL"] = { "<cmd>TodoLocList<cr>", desc = "Location List (Todo)" },
        },
      },
    },
  },
  opts = {},
  event = "User AstroFile",
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
}
