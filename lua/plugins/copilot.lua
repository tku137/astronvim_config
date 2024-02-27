if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = { suggestion = { auto_trigger = true, debounce = 150 } },
    -- config = function()
    --   require("copilot").setup {
    --     suggestion = { enabled = true },
    --     panel = { enabled = true },
    --   }
    -- end,
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function() require("copilot_cmp").setup() end,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "zbirenbaum/copilot.lua",
  --     "zbirenbaum/copilot-cmp",
  --   },
  --   opts = function(_, opts)
  --     local cmp, copilot = require "cmp", require "copilot.suggestion"
  --     local snip_status_ok, luasnip = pcall(require, "luasnip")
  --     if not snip_status_ok then return end
  --     opts.sources = {
  --       { name = "nvim_lsp", priority = 1000, group_index = 1, max_item_count = 15 },
  --       { name = "copilot", priority = 900, group_index = 1 },
  --       { name = "luasnip", priority = 750, group_index = 1, max_item_count = 8 },
  --       { name = "path", priority = 500, group_index = 2 },
  --       { name = "buffer", priority = 250, group_index = 2 },
  --     }
  --     local has_words_before = function()
  --       if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
  --     end
  --     if not opts.mapping then opts.mapping = {} end
  --     opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
  --       if copilot.is_visible() then
  --         copilot.accept()
  --       elseif cmp.visible() then
  --         cmp.select_next_item()
  --       elseif luasnip.expand_or_jumpable() then
  --         luasnip.expand_or_jump()
  --       elseif has_words_before() then
  --         cmp.complete()
  --       else
  --         fallback()
  --       end
  --     end, { "i", "s" })
  --
  --     return opts
  --   end,
  -- },
}
