-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local prefix = "<Leader>fD"

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.editing-support.nvim-devdocs" },
    {
      "luckasRanarison/nvim-devdocs",
      keys = {},
      opts = {
        previewer_cmd = vim.fn.executable "glow" == 1 and "glow" or nil,
        cmd_args = { "-s", "dark", "-w", "80" },
        picker_cmd = true,
        picker_cmd_args = { "-p" },
      },
    },
    {
      -- further customize the options set by the community
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [prefix] = { desc = "󰯃 DevDocs" },
            [prefix .. "f"] = { "<CMD>DevdocsFetch<CR>", desc = "Fetch Devdocs" },
            [prefix .. "i"] = { "<CMD>DevdocsInstall<CR>", desc = "Install Devdocs" },
            [prefix .. "u"] = { "<CMD>DevdocsUpdate<CR>", desc = "Update Devdocs" },
            [prefix .. "U"] = { "<CMD>DevdocsUpdateAll<CR>", desc = "Update all Devdocs" },
            [prefix .. "d"] = {
              "<CMD>DevdocsOpenCurrentFloat<CR>",
              desc = "Find Devdocs for current file",
            },
            [prefix .. "D"] = { "<CMD>DevdocsOpenFloat<CR>", desc = "Find Devdocs" },
          },
        },
      },
    },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "html" })
      end
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              [prefix] = { desc = "󰯃 DevDocs" },
              [prefix .. "f"] = { "<CMD>DevdocsFetch<CR>", desc = "Fetch Devdocs" },
              [prefix .. "i"] = { "<CMD>DevdocsInstall<CR>", desc = "Install Devdocs" },
              [prefix .. "u"] = { "<CMD>DevdocsUpdate<CR>", desc = "Update Devdocs" },
              [prefix .. "U"] = { "<CMD>DevdocsUpdateAll<CR>", desc = "Update all Devdocs" },
              [prefix .. "d"] = {
                "<CMD>DevdocsOpenCurrentFloat<CR>",
                desc = "Find Devdocs for current file",
              },
              [prefix .. "D"] = { "<CMD>DevdocsOpenFloat<CR>", desc = "Find Devdocs" },
            },
          },
        },
      },
    },
    cmd = {
      "DevdocsFetch",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsUpdate",
      "DevdocsUpdateAll",
    },
    opts = {
      previewer_cmd = vim.fn.executable "glow" == 1 and "glow" or nil,
      cmd_args = { "-s", "dark", "-w", "80" },
      picker_cmd = true,
      picker_cmd_args = { "-p" },
    },
  },
}
