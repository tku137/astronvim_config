-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "folke/twilight.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uT"] = { "<CMD>Twilight<CR>", desc = "Toggle Twilight" },
          },
        },
      },
    },
  },
  cmd = {
    "Twilight",
    "TwilightEnable",
    "TwilightDisable",
  },
}
