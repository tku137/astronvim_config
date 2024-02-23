-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
          "python",
          "toml",
        })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "pyright",
        "ruff_lsp",
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "black",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
      })
      if not opts.handlers then opts.handlers = {} end
      opts.handlers.python = function() end -- make sure python doesn't get set up by mason-nvim-dap, it's being set up by nvim-dap-python
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {},
    cmd = { "VenvSelect", "VenvSelectCached" },
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<leader>dPm"] = { "require('dap-python').test_method()", desc = "Debug method" },
              ["<leader>dPc"] = { "require('dap-python').test_class()", desc = "Debug class" },
              ["<leader>dPs"] = { "<ESC>:lua require('dap-python').debug_selection()", desc = "Debug selection" },
              ["<leader>dP"] = { desc = " Python debugger", },
            },
          },
        },
      },
    },
    ft = "python", -- NOTE: ft: lazy-load on filetype
    config = function(_, opts)
      local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
      require("dap-python").setup(path, opts)
      table.insert(require("dap").configurations.python, 1, {
        type = "python",
        request = "launch",
        name = "Python: Debug file with justMyCode=false",
        program = "${file}",
        -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
        justMyCode = false,
      })
    end,
  },
  {
    "nvim-neotest/neotest-python",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
              -- Extra arguments for nvim-dap configuration
              -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
              dap = { justMyCode = false },
              -- Command line arguments for runner
              -- Can also be a function to return dynamic values
              args = {"--log-level", "DEBUG"},
              -- Runner to use. Will use pytest if available by default.
              -- Can be a function to return dynamic value.
              runner = "pytest",
              -- Custom python path for the runner.
              -- Can be a string or a list of strings.
              -- Can also be a function to return dynamic value.
              -- If not provided, the path will be inferred by checking for 
              -- virtual envs in the local directory and for Pipenev/Poetry configs
              -- python = ".venv/bin/python",
              -- Returns if a given file path is a test file.
              -- NB: This function is called a lot so don't perform any heavy tasks within it.
              -- is_test_file = function(file_path)
              --   ...
              -- end,
              -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
              -- instances for files containing a parametrize mark (default: false)
              -- pytest_discover_instances = true,
          })
        }
      })
    end,
  }
}
