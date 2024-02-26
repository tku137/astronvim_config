-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = {
      rooter = false,
      mappings = {
        n = {
          ["<Leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find projects" },
        },
      },
    },
  },
  {
    "jay-babu/project.nvim",
    main = "project_nvim",
    event = "VeryLazy",
    opts = { ignore_lsp = { "lua_ls" } },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "jay-babu/project.nvim" },
    opts = function() require("telescope").load_extension "projects" end,
  },
}
