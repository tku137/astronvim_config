-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
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
    opts.textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>lz"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>lZ"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
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
    }
  end,
}
