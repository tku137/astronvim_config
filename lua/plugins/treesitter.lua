-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
  },
  keys = {
    { "<leader>lP", "<cmd>TSPlaygroundToggle<cr>", desc = "Toggle TS Playgound" },
    { "<leader>lt", "<cmd>TSHighlightCapturesUnderCursor<cr>", desc = "TS Highlight under Cursor" },
    { "<leader>lT", "<cmd>TSNodeUnderCursor<cr>", desc = "TS Node under Cursor" },
  },
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(
      opts.ensure_installed,
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
      -- python
      "python",
      -- cpp
      "cpp",
      "cmake",
      "make",
      -- bash
      "bash",
      -- git
      "diff",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitignore",
      "gitcommit",
      -- docker
      "dockerfile",
      -- cloud
      "terraform",
      -- md
      "markdown",
      "markdown_inline",
      -- general
      "json", "yaml", "toml", "query",
      -- sql
      "sql"
    )
  end,
      textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
    playground = {
      enable = true,
    }
}
