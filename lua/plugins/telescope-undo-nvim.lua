-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "debugloop/telescope-undo.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fu"] = { "<CMD>Telescope undo<CR>", desc = "Find undos" },
          },
        },
      },
    },
  },
  opts = function() require("telescope").load_extension "undo" end,
}
