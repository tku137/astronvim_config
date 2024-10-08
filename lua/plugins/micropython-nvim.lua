-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = false -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {}
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {
  "jim-at-jibba/micropython.nvim",
  -- Load the plugin only when these commands are used
  cmd = { "MPRun", "MPRepl", "MPInit", "MPUpload", "MPUploadAll" },
  -- event = "User AstroFile",
  dependencies = {
    "akinsho/toggleterm.nvim",
    "stevearc/dressing.nvim",
    { "AstroNvim/astroui", opts = { icons = { MicroPython = "" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>m"
        maps.n[prefix] = { desc = require("astroui").get_icon("MicroPython", 1, true) .. "MicroPython" }
        maps.n[prefix .. "r"] = { "<Cmd>MPRun<CR>", desc = "runs current buffer on the micro-controller" }
        maps.n[prefix .. "R"] = { "<Cmd>MPRepl<CR>", desc = "opens the REPL" }
        maps.n[prefix .. "I"] = { "<Cmd>MPInit<CR>", desc = "initialize basic project" }
        maps.n[prefix .. "u"] = { "<Cmd>MPUpload<CR>", desc = "uploads the current buffer to the micro-controller" }
        maps.n[prefix .. "U"] = { "<Cmd>MPUploadAll<CR>", desc = "uploads all files in the project" }
      end,
    },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local utils = require "heirline.utils"
        local micro_component = {
          provider = function() return require("micropython_nvim").statusline() end,
          condition = function() return package.loaded["micropython_nvim"] and require("micropython_nvim").exists() end,
          padding = { left = 1, right = 1 },
          hl = function()
            local theme_hl = utils.get_highlight "@comment.note"
            return {
              bg = theme_hl.bg,
              fg = theme_hl.fg,
            }
          end,
        }
        local spacer = {
          provider = " ",
        }
        table.insert(opts.statusline, #opts.statusline, spacer)
        table.insert(opts.statusline, #opts.statusline, micro_component)
      end,
    },
  },
  -- Config function to set up project-specific file detection
  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "AstroFile",
      callback = function()
        -- Detect if the current directory contains MicroPython-specific files
        local micro_project_files = { "main.py", ".ampy" }
        for _, file in ipairs(micro_project_files) do
          if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. file) == 1 then
            -- Dynamically load the micropython.nvim plugin
            require("lazy").load { plugins = { "jim-at-jibba/micropython.nvim" } }
            return
          end
        end
      end,
    })
  end,
}
