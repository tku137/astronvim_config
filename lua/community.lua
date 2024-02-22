-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

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

  -- code completion and AI
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.completion.cmp-cmdline" },

  -- editing support
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },

  -- debugging
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },

  -- git
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.diffview-nvim" },

  -- testing
  { import = "astrocommunity.test.neotest" },

  -- search and replace
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },

  -- language packs
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.programming-language-support.csv-vim" },

  -- telescope
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },

}
