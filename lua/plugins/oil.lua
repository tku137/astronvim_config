return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>O"] = { function() require("oil").open() end, desc = "Open folder in Oil" },
            },
          },
        },
      },
      "SirZenith/oil-vcs-status",
    },
    opts = {},
    config = function()
      require("oil").setup({
        -- your oil.nvim setup
        win_options = {
          signcolumn = "yes:2",
        },
      })
      local status_const = require("oil-vcs-status.constant.status")
      local StatusType = status_const.StatusType
      require("oil-vcs-status").setup({
        -- your oil-vcs-status setup
        status_symbol = {
          [StatusType.Added]                = "",
          [StatusType.Copied]               = "󰆏",
          [StatusType.Deleted]              = "",
          [StatusType.Ignored]              = "",
          [StatusType.Modified]             = "",
          [StatusType.Renamed]              = "",
          [StatusType.TypeChanged]          = "󰉺",
          [StatusType.Unmodified]           = " ",
          [StatusType.Unmerged]             = "",
          [StatusType.Untracked]            = "",
          [StatusType.External]             = "",

          [StatusType.UpstreamAdded]       = "󰈞",
          [StatusType.UpstreamCopied]      = "󰈢",
          [StatusType.UpstreamDeleted]     = "",
          [StatusType.UpstreamIgnored]     = " ",
          [StatusType.UpstreamModified]    = "󰏫",
          [StatusType.UpstreamRenamed]     = "",
          [StatusType.UpstreamTypeChanged] = "󱧶",
          [StatusType.UpstreamUnmodified]  = " ",
          [StatusType.UpstreamUnmerged]    = "",
          [StatusType.UpstreamUntracked]   = " ",
          [StatusType.UpstreamExternal]    = "",
      }
      })
    end,
  },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts)
      local status = require "astroui.status"
      local is_oil = function(bufnr) return status.condition.buffer_matches({ filetype = "^oil$" }, bufnr) end
      local disable_winbar_cb = opts.opts.disable_winbar_cb
      opts.opts.disable_winbar_cb = function(args)
        if is_oil(args.buf) then return false end
        return disable_winbar_cb(args)
      end

      if opts.winbar then
        table.insert(opts.winbar, 1, {
          condition = function(self) return is_oil(self.bufnr) end,
          status.component.separated_path {
            padding = { left = 2 },
            max_depth = false,
            suffix = false,
            path_func = function() return require("oil").get_current_dir() end,
          },
        })
      end
    end,
  },
}
