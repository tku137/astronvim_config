if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- TODO: Remove branch v4 on release
  { "AstroNvim/astrocommunity", branch = "v4" },
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  -- color schemes
  {
    { import = "astrocommunity.colorscheme.catppuccin" },
    {
      -- further customize the options set by the community
      "catppuccin",
      opts = {
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "macchiato",
        },
        term_colors = true,
        dim_inactive = { enabled = true, percentage = 0.25 },
        integrations = {
          flash = true,
          cmp = true,
          gitsigns = true,
          indent_blankline = { enabled = true },
          harpoon = true,
          lsp_trouble = false,
          markdown = true,
          neogit = true,
          neotree = true,
          noice = true,
          rainbow_delimiters = true,
          treesitter = true,
          ufo = true,
        },
      },
    },
  },

  -- motion
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.mini-surround" },

  -- visuals
  -- { import = "astrocommunity.split-and-window.edgy-nvim" },
  -- { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  {
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    {
      -- further customize the options set by the community
      "nvim-treesitter/nvim-treesitter",
      opts = {
        rainbow = {
          -- list of languages you want to disable the plugin for
          disable = { "jsx", "cpp" },
        },
      },
    },
  },
  {
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
  },
  { import = "astrocommunity.color.twilight-nvim" },

  -- code completion and AI
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.completion.cmp-cmdline" },

  -- editing support
  {
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>xt"] = { "<cmd>TodoTelescope<cr>", desc = "Open Todos in Telescope" },
            ["<Leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "Open Todos in Trouble" },
            ["<Leader>xQ"] = { "<cmd>TodoQuickFix<cr>", desc = "Quickfix List (Todo)" },
            ["<Leader>xL"] = { "<cmd>TodoLocList<cr>", desc = "Location List (Todo)" },
          },
        },
      },
    },
  },

  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },

  -- linters and formatters
  -- { import = "astrocommunity.editing-support.conform-nvim" },
  -- {
  --   { import = "astrocommunity.editing-support.conform-nvim" },
  --   {
  --     -- further customize the options set by the community
  --     "AstroNvim/astrocore",
  --     opts = {
  --       mappings = {
  --         n = {
  --           ["<Leader>lI"] = { function() vim.cmd.ConformInfo() end, desc = "Conform information" },
  --         },
  --       },
  --     },
  --   },
  -- },
  { import = "astrocommunity.lsp.nvim-lint" },

  -- debugging
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  {
    { import = "astrocommunity.debugging.telescope-dap-nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fd"] = { desc = " DAP" },
          },
        },
      },
    },
  },

  -- git
  {
    { import = "astrocommunity.git.neogit" },
    {
      -- further customize the options set by the community
      "NeogitOrg/neogit",
      cmd = "Neogit",
    },
  },
  {
    { import = "astrocommunity.git.diffview-nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>gDo"] = { "<cmd>DiffviewOpen<cr>", desc = "Open" },
            ["<Leader>gDc"] = { "<cmd>DiffviewClose<cr>", desc = "Close" },
            ["<Leader>gDr"] = { "<cmd>DiffviewRefresh<cr>", desc = "Refresh" },
            ["<Leader>gDf"] = { "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
            ["<Leader>gDF"] = { "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
            ["<Leader>gDm"] = { "<cmd>h Diffview-merge-tool<cr>", desc = "Help merge tool" },
            ["<Leader>gD"] = { desc = " Diffview" },
          },
        },
      },
    },
  },

  -- testing
  {
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
  },

  -- search and replace
  {
    { import = "astrocommunity.project.project-nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find projects" },
          },
        },
      },
    },
  },
  { import = "astrocommunity.project.nvim-spectre" },

  -- language packs
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  -- { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.programming-language-support.csv-vim" },

  -- telescope
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
}
