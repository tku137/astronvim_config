-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.file-explorer.oil-nvim" },
    {
      "stevearc/oil.nvim",
      dependencies = {
        "SirZenith/oil-vcs-status",
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("oil").setup {
          -- your oil.nvim setup
          columns = {
            "icon",
            -- "permissions",
            "size",
            -- "mtime",
          },
          win_options = {
            signcolumn = "yes:2",
          },
          skip_confirm_for_simple_edits = true,
        }
        local status_const = require "oil-vcs-status.constant.status"
        local StatusType = status_const.StatusType
        require("oil-vcs-status").setup {
          -- your oil-vcs-status setup
          status_symbol = {
            [StatusType.Added] = "",
            [StatusType.Copied] = "󰆏",
            [StatusType.Deleted] = "",
            [StatusType.Ignored] = "",
            [StatusType.Modified] = "",
            [StatusType.Renamed] = "",
            [StatusType.TypeChanged] = "󰉺",
            [StatusType.Unmodified] = " ",
            [StatusType.Unmerged] = "",
            [StatusType.Untracked] = "",
            [StatusType.External] = "",

            [StatusType.UpstreamAdded] = "󰈞",
            [StatusType.UpstreamCopied] = "󰈢",
            [StatusType.UpstreamDeleted] = "",
            [StatusType.UpstreamIgnored] = " ",
            [StatusType.UpstreamModified] = "󰏫",
            [StatusType.UpstreamRenamed] = "",
            [StatusType.UpstreamTypeChanged] = "󱧶",
            [StatusType.UpstreamUnmodified] = " ",
            [StatusType.UpstreamUnmerged] = "",
            [StatusType.UpstreamUntracked] = " ",
            [StatusType.UpstreamExternal] = "",
          },
        }
      end,
    },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {}
