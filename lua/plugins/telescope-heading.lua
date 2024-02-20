return {
  'crispgm/telescope-heading.nvim',
  ft = { "markdown", "text", "rst", "latex", "tex" },
  dependencies = 'nvim-telescope/telescope.nvim',
  keys = {
    { "<leader>fH", "<cmd>Telescope headings<cr>", desc = "Find headings" },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
        extensions = {
            heading = {
                treesitter = true,
            },
        },
    })
    require('telescope').load_extension('heading')
  end,
}
