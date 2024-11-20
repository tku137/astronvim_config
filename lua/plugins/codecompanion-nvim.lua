-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "AstroNvim/astroui", opts = { icons = { CodeCompanion = "󱓞" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        if not opts.mappings then opts.mappings = {} end
        local prefix = "<leader>A"

        opts.mappings.n[prefix] = { desc = require("astroui").get_icon("CodeCompanion", 1, true) .. "CodeCompanion" }
        opts.mappings.v[prefix] = { desc = require("astroui").get_icon("CodeCompanion", 1, true) .. "CodeCompanion" }

        opts.mappings.n[prefix .. "c"] = { "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" }
        opts.mappings.n[prefix .. "t"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Toggle Chat" }
        opts.mappings.v[prefix .. "t"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Toggle Chat" }

        opts.mappings.n[prefix .. "a"] = { "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Action Palette" }
        opts.mappings.v[prefix .. "a"] = { "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Action Palette" }

        opts.mappings.v["ga"] = { "<cmd>CodeCompanionAdd<cr>", desc = "CodeCompanion add" }
      end,
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = function(_, opts)
        if not opts.file_types then opts.file_types = { "markdown" } end
        opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "codecompanion" })
      end,
    },
  },
  specs = {
    { "nvim-telescope/telescope.nvim", optional = true },
    { "hrsh7th/nvim-cmp", optional = true },
    { "stevearc/dressing.nvim", opts = {}, optional = true },
  },
  config = true,
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "openai",
      },
      agent = {
        adapter = "openai",
        -- tools = {
        --   ["@editor"] = true, -- Enables buffer editing directly
        -- },
      },
    },
    adapters = {
      openai = function()
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = os.getenv "OPENAI_API_KEY",
          },
        })
      end,
    },
    display = {
      action_palette = {
        provider = "telescope",
      },
    },
  },
  cmd = { "CodeCompanionToggle", "CodeCompanionAdd", "CodeCompanionActions", "CodeCompanion" },
}
