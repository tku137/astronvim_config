-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = true -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.completion.cmp-cmdline" },
    { import = "astrocommunity.completion.cmp-git" },
    { import = "astrocommunity.completion.cmp-latex-symbols" },
    { import = "astrocommunity.completion.cmp-nvim-lua" },
    { import = "astrocommunity.completion.cmp-tmux" },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {}
