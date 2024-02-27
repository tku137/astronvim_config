-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    {
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
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {}
