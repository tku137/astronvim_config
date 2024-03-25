-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return { import = "astrocommunity.git.fugit2-nvim" }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {
  {
    "SuperBo/fugit2.nvim",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      {
        "chrisgrieser/nvim-tinygit", -- optional: for Github PR view
        dependencies = { "stevearc/dressing.nvim" },
      },
      "sindrets/diffview.nvim", -- optional: for Diffview
    },
    cmd = { "Fugit2", "Fugit2Graph", "Fugit2Diff" },
  },
  { "AstroNvim/astroui", opts = { icons = { Fugit = "󰯼" } } },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      local prefix = "<Leader>gf"
      maps.n[prefix] = { desc = require("astroui").get_icon("Fugit", 1, true) .. "Fugit2" }
      maps.n[prefix .. "f"] = { "<Cmd>Fugit2<CR>", desc = "Open Fugit2" }
      maps.n[prefix .. "g"] = { "<Cmd>Fugit2Graph<CR>", desc = "Open Fugit2 Graph" }
      maps.n[prefix .. "d"] = { "<Cmd>Fugit2Diff<CR>", desc = "Open Fugit2 Diffview" }
    end,
  },
}
