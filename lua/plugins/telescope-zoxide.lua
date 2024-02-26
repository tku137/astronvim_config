-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "jvgrootveld/telescope-zoxide",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fz"] = { "<CMD>Telescope zoxide list<CR>", desc = "Find directories" },
          },
        },
      },
    },
  },
  opts = function() require("telescope").load_extension "zoxide" end,
}
