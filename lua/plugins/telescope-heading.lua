-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "crispgm/telescope-heading.nvim",
  ft = { "markdown", "text", "rst", "latex", "tex" },
  dependencies = "nvim-telescope/telescope.nvim",
  keys = {
    { "<Leader>fH", "<cmd>Telescope headings<cr>", desc = "Find headings" },
  },
  config = function()
    local telescope = require "telescope"
    telescope.setup {
      extensions = {
        heading = {
          treesitter = true,
        },
      },
    }
    require("telescope").load_extension "heading"
  end,
}
