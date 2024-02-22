-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend settig up the Lua Language Server (lua_ls) as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        scrolloff = 10, -- sets vim.opt.scrolloff
        virtualedit = "block" -- sets vim.opt.virtualedit
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        
        -- Tab Mappings
        ["<leader>btn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>btc"] = { "<cmd>tabclose<cr>", desc = "Close tab" },
        ["<leader>bth"] = { "<cmd>tabprevious<cr>", desc = "Left tab" },
        ["<leader>btl"] = { "<cmd>tabnext<cr>", desc = "Right tab" },
        -- a table with the `name` key will register with which-key if it's available
        -- this an easy way to add menu titles in which-key
        ["<leader>bt"] = { name = "󰓩 Tabs" },


        -- Copy/paste with system clipboard
        ["gy"] = { '"+y', desc = "Copy to system clipboard" },
        ["gp"] = { '"+p', desc = "Paste from system clipboard" },
        ["gP"] = { '"+P', desc = "Paste from system clipboard" },

        -- Move with alt in insert, terminal and command
        -- Don't `noremap` in insert mode to have these keybindings behave exactly
        -- like arrows (crucial inside TelescopePrompt)
        -- ["<M-h>"] = { "<Left>", noremap = false, desc = "Left" },
        -- ["<M-j>"] = { "<Down>", noremap = false, desc = "Down" },
        -- ["<M-k>"] = { "<Up>", noremap = false, desc = "Up" },
        -- ["<M-l>"] = { "<Right>", noremap = false, desc = "Right" },


        -- some plugin mappings
        ["<leader>fs"] = { "<cmd>Telescope aerial<cr>", desc = "Search symbols" },
        ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find projects" },

        -- Treesitter mappings
        ["<leader>lQ"] = { "<cmd>EditQuery<cr>", desc = "TS Live Query Editor", },
        ["<leader>lt"] = { "<cmd>Inspect<cr>", desc = "TS Node under Cursor", },
        ["<leader>lT"] = { "<cmd>InspectTree<cr>", desc = "Show AST", },


        -- Diffview mappings
        ["<leader>gDo"] = { "<cmd>DiffviewOpen<cr>", desc = "Open" },
        ["<leader>gDc"] = { "<cmd>DiffviewClose<cr>", desc = "Close" },
        ["<leader>gDr"] = { "<cmd>DiffviewRefresh<cr>", desc = "Refresh" },
        ["<leader>gDf"] = { "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
        ["<leader>gDF"] = { "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
        ["<leader>gDm"] = { "<cmd>h Diffview-merge-tool<cr>", desc = "Help merge tool" },
        ["<leader>gD"] = { desc = " Diffview" },

        -- put todo-comments under trouble group
        ["<leader>xt"] = { "<cmd>TodoTelescope<cr>", desc = "Open Todos in Telescope" },
        ["<leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "Open Todos in Trouble" },
        ["<leader>xQ"] = { "<cmd>TodoQuickFix<cr>", desc = "Quickfix List (Todo)" },
        ["<leader>xL"] = { "<cmd>TodoLocList<cr>", desc = "Location List (Todo)" },

        -- fix missing descriptions in which-key
        -- ["<leader>dt"] = { desc = "󰃤 Telescope DAP", },
        ["<leader>gn"] = { desc = "󰊢 Neogit", },

        -- debug mappings
        ["<leader>dPm"] = { "require('dap-python').test_method()", desc = "Debug method" },
        ["<leader>dPc"] = { "require('dap-python').test_class()", desc = "Debug class" },
        ["<leader>dPs"] = { "<ESC>:lua require('dap-python').debug_selection()", desc = "Debug selection" },
        ["<leader>dP"] = { desc = " Python debugger", },

        -- testing
        -- ["<leader>T"] = { name = "󰙨 Test" },
        -- ["<leader>TF"] = { "<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", desc = "Debug File" },
        -- ["<leader>TL"] = { "<cmd>w|lua require('neotest').run.run_last({strategy = 'dap'})<cr>", desc = "Debug Last" },
        -- ["<leader>Ta"] = { "<cmd>w|lua require('neotest').run.attach()<cr>", desc = "Attach" },
        -- ["<leader>Tf"] = { "<cmd>w|lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
        -- ["<leader>Tl"] = { "<cmd>w|lua require('neotest').run.run_last()<cr>", desc = "Last" },
        -- ["<leader>Tn"] = { "<cmd>w|lua require('neotest').run.run()<cr>", desc = "Nearest" },
        -- ["<leader>TN"] = { "<cmd>w|lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest" },
        -- ["<leader>To"] = { "<cmd>w|lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
        -- ["<leader>Ts"] = { "<cmd>w|lua require('neotest').run.stop()<cr>", desc = "Stop" },
        -- ["<leader>TS"] = { "<cmd>w|lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        ["<C-Space>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
        ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
      },
      v = {
        -- send to Python REPL
        ["<leader>r"] = { function() require('nvim-python-repl').send_visual_to_repl() end, desc = "Send visual selection to REPL" },

        -- Copy/paste with system clipboard
        ["gy"] = { '"+y', desc = "yank to system clipboard" },
        ["gp"] = { '"+p', desc = "paste from system clipboard" },
        ["gP"] = { '"+P', desc = "paste from system clipboard" },

        -- Search visually selected text (slightly better than builtins in Neovim>=0.8)
        ["*"] = { [[y/\V<C-R>=escape(@", '/\')<CR><CR>]] },
        ["#"] = { [[y?\V<C-R>=escape(@", '?\')<CR><CR>]] },
      },
    },
  },
}
