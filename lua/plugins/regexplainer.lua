-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "bennypowers/nvim-regexplainer",
    opts = {},
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "python" },
  },
  -- Regex support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add regex to treesitters
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "regex" })
      end
    end,
  },
}
