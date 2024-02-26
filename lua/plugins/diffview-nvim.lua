-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "sindrets/diffview.nvim",
  dependencies = {
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
  event = "User AstroGitFile",
  cmd = { "DiffviewOpen" },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { winbar_info = true },
      file_history = { winbar_info = true },
    },
    hooks = { diff_buf_read = function(bufnr) vim.b[bufnr].view_activated = false end },
  },
}, {
  "NeogitOrg/neogit",
  optional = true,
  opts = { integrations = { diffview = true } },
}
