-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "wintermute-cell/gitignore.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional: for multi-select
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>gi"] = { "<CMD>Gitignore<CR>", desc = "Generate .gitignore" },
            },
          },
        },
      },
    },
    config = function()
      -- If we want to overwrite existing .gitignore files or append to them
      vim.g.gitignore_nvim_overwrite = false -- or true if you want to overwrite existing .gitignore files
    end,
  },
}
