-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.test.neotest" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>TF"] = {
              "<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
              desc = "Debug File",
            },
            ["<Leader>TL"] = {
              "<cmd>w|lua require('neotest').run.run_last({strategy = 'dap'})<cr>",
              desc = "Debug Last",
            },
            ["<Leader>Ta"] = { "<cmd>w|lua require('neotest').run.attach()<cr>", desc = "Attach" },
            ["<Leader>Tl"] = { "<cmd>w|lua require('neotest').run.run_last()<cr>", desc = "Last" },
            ["<Leader>Tn"] = { "<cmd>w|lua require('neotest').run.run()<cr>", desc = "Nearest" },
            ["<Leader>TN"] = { "<cmd>w|lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest" },
            ["<Leader>Ts"] = { "<cmd>w|lua require('neotest').run.stop()<cr>", desc = "Stop" },
          },
        },
      },
    },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {}
