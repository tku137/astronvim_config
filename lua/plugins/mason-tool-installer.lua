-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.utility.mason-tool-installer-nvim" },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    dependencies = { "williamboman/mason.nvim" },
    init = function(plugin) require("astrocore").on_load("mason.nvim", plugin.name) end,
    opts = {
      ensure_installed = {
        -- WARNING: Most of the language servers are handled by community packs

        -- Language Servers
        -- "clangd",
        -- "lua_ls",
        -- "marksman",
        -- "ruff",
        -- "texlab",
        -- "yamlls",

        -- Linters
        -- "luacheck",
        -- "shellcheck",

        -- Formatters
        -- "prettier",
        -- "black",
        -- "shfmt",
        -- "stylua",

        -- Debuggers
        -- "bash-debug-adapter",
        -- "cpptools",
        -- "debugpy",
      },
    },
    config = function(_, opts)
      local mason_tool_installer = require "mason-tool-installer"
      mason_tool_installer.setup(opts)
      mason_tool_installer.run_on_start()
    end,
  },
  { "jay-babu/mason-nvim-dap.nvim", optional = true, init = false },
  { "williamboman/mason-lspconfig.nvim", optional = true, init = false },
  { "jay-babu/mason-null-ls.nvim", optional = true, init = false },
}
