-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local use_community = true -- Set to true to use the community plugin spec

if use_community then
  ---@type LazySpec
  return {
    -- Import the Molten plugin from the AstroNvim community
    { import = "astrocommunity.code-runner.molten-nvim" },
    {
      -- further customize the options set by the community
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            -- next/prec cell: MoltenNext, MoltenPrev
            ["<Leader>m"] = { desc = "󱓞 Molten" },
            ["<Leader>mh"] = { "<Cmd>MoltenHideOutput<CR>", desc = "Hide Output" },
            ["<Leader>mm"] = { desc = "Commands" },
            ["<Leader>mmI"] = { "<Cmd>MoltenInterrupt<CR>", desc = "Interrupt Kernel" },
            ["<Leader>mmR"] = { "<Cmd>MoltenRestart<CR>", desc = "Restart Kernel" },
            ["<Leader>mr"] = { desc = "Evaluate" },
            ["]c"] = { "<Cmd>MoltenNext<CR>", desc = "Next Molten Cel" },
            ["[c"] = { "<Cmd>MoltenPrev<CR>", desc = "Previous Molten Cell" },
          },
          v = {
            ["<Leader>m"] = { desc = "󱓞 Molten" },
          },
        },
      },
    },

    -- Configure heirline.nvim to add the Molten status component
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local utils = require "heirline.utils"
        local molten_component = {
          provider = function()
            -- Display the status of Molten and attached kernels
            local init_status = require("molten.status").initialized()
            local kernel_status = require("molten.status").kernels()
            local info = (init_status ~= "" and init_status .. ": ") .. kernel_status
            return info ~= "" and info or ""
          end,
          condition = function() return require("molten.status").initialized() ~= "" end,
          padding = { left = 1, right = 1 },
          hl = function()
            local theme_hl = utils.get_highlight "@comment.note"
            return {
              bg = theme_hl.bg,
              fg = theme_hl.fg,
            }
          end,
        }
        local spacer = { provider = " " }
        table.insert(opts.statusline, #opts.statusline, spacer)
        table.insert(opts.statusline, #opts.statusline, molten_component)
      end,
    },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {}
