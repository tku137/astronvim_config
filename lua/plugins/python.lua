-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(
          opts.ensure_installed,
          "python",
          "toml"
        )
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        "pyright",
        "ruff_lsp"
      )
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts) opts.ensure_installed = require("astrocore").list_insert_unique(
      opts.ensure_installed,
      "black"
    ) end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        "python"
      )
      if not opts.handlers then opts.handlers = {} end
      opts.handlers.python = function() end -- make sure python doesn't get set up by mason-nvim-dap, it's being set up by nvim-dap-python
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {},
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    ft = "python", -- NOTE: ft: lazy-load on filetype
    keys = {
      { "<leader>dPm", "require('dap-python').test_method()", desc = "Debug method" },
      { "<leader>dPc", "require('dap-python').test_class()", desc = "Debug class" },
      { "<leader>dPs", "<ESC>:lua require('dap-python').debug_selection()", desc = "Debug selection" },
      { "<leader>dP", desc = " Python debugger", },
    },
    config = function(_, opts)
      local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
      require("dap-python").setup(path, opts)
      table.insert(require('dap').configurations.python, 1, {
        type = 'python',
        request = 'launch',
        name = 'Python: Debug file with justMyCode=false',
        program = '${file}',
        -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
        justMyCode = false,
      })
    end,
  },
}
