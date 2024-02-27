-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.git.diffview-nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>gDo"] = { "<cmd>DiffviewOpen<cr>", desc = "Open" },
            ["<Leader>gDc"] = { "<cmd>DiffviewClose<cr>", desc = "Close" },
            ["<Leader>gDr"] = { "<cmd>DiffviewRefresh<cr>", desc = "Refresh" },
            ["<Leader>gDf"] = { "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
            ["<Leader>gDF"] = { "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
            ["<Leader>gDm"] = { "<cmd>h Diffview-merge-tool<cr>", desc = "Help merge tool" },
            ["<Leader>gD"] = { desc = " Diffview" },
          },
        },
      },
    },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {}
