-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "nguyenvukhang/nvim-toggler",
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>lc"] = { "<cmd>w|lua require('nvim-toggler').toggle()<cr>", desc = "Toggle word under cursor" },
          },
        },
      },
    },
    config = function()
      require("nvim-toggler").setup {
        remove_default_keybinds = true,
      }
    end,
  },
}
