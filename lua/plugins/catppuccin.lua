-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    ---@type CatppuccinOptions
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "macchiato",
      },
      term_colors = true,
      dim_inactive = { enabled = true, percentage = 0.25 },
      integrations = {
        -- TODO: move catppuccin integrations to each plugin spec
        alpha = true,
        aerial = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        flash = true,
        gitsigns = true,
        harpoon = true,
        indent_blankline = { enabled = true },
        lsp_trouble = false,
        markdown = true,
        mason = true,
        -- mini = true,
        -- neogit = true,
        -- neotest = true,
        neotree = true,
        -- noice = true,
        notify = true,
        nvimtree = false,
        -- rainbow_delimiters = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        ufo = true,
        which_key = true,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
}
