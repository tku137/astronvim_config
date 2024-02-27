-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.editing-support.zen-mode-nvim" },
    {
      -- further customize the options set by the community
      "folke/zen-mode.nvim",
      dependencies = {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>z"] = { "<Cmd>ZenMode<CR>", desc = "Zen Mode" },
            },
          },
        },
      },
    },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {}
