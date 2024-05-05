-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- choose to use the community plugin or a custom plugin spec down below
local use_community = false -- INFO: Set to false to use a custom plugin spec

if use_community then
  ---@type LazySpec
  return {
    { import = "astrocommunity.note-taking.global-note-nvim" },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
local get_project_name_cwd = function()
  local project_directory, err = vim.loop.cwd()
  if project_directory == nil then
    vim.notify(err, vim.log.levels.WARN)
    return nil
  end

  local project_name = vim.fs.basename(project_directory)
  if project_name == nil then
    vim.notify("Unable to get the project name", vim.log.levels.WARN)
    return nil
  end

  return project_name
end

local get_project_name_git = function()
  -- Create the command as a single string
  local command = "git rev-parse --show-toplevel"
  local result = vim.fn.system(command)

  -- Check if there was an error with the command
  if vim.v.shell_error ~= 0 then
    vim.notify(result, vim.log.levels.WARN)
    return nil
  end

  -- Remove trailing newline and get the project name
  local project_directory = result:gsub("\n", "")
  local project_name = vim.fs.basename(project_directory)
  if not project_name then
    vim.notify("Unable to get the project name", vim.log.levels.WARN)
    return nil
  end

  return project_name
end

local get_project_name_git_branch = function()
  -- First, get the repository name using the existing function
  local repo_name = get_project_name_git()
  if repo_name == nil then
    vim.notify("Unable to fetch repository name", vim.log.levels.WARN)
    return nil
  end

  -- Now fetch the current branch name
  local command = "git symbolic-ref --short HEAD"
  local result = vim.fn.system(command)

  -- Check if there was an error with the command
  if vim.v.shell_error ~= 0 then
    vim.notify(result, vim.log.levels.WARN)
    return nil
  end

  -- Remove trailing newline
  local branch_name = result:gsub("\n", "")

  -- Combine repo name and branch name for a unique note identifier
  if branch_name == "" then
    vim.notify("Branch name is empty, possibly in a detached HEAD state.", vim.log.levels.WARN)
    return nil
  end

  return repo_name .. "_" .. branch_name
end

return {
  "backdround/global-note.nvim",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Notes = " " } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>m"

        maps.n[prefix] = { desc = require("astroui").get_icon("Notes", 1, true) .. "Notes" }
        maps.n[prefix .. "m"] = {
          function() require("global-note").toggle_note() end,
          desc = "Toggle global note",
        }
        maps.n[prefix .. "l"] = {
          function() require("global-note").toggle_note "project_local" end,
          desc = "Toggle local note",
        }
        maps.n[prefix .. "r"] = {
          function() require("global-note").toggle_note "project_repo" end,
          desc = "Toggle repo note",
        }
        maps.n[prefix .. "b"] = {
          function() require("global-note").toggle_note "project_branch" end,
          desc = "Toggle branch note",
        }
      end,
    },
  },
  opts = {
    directory = "~/Obsidian/SecondBrain/82 Neovim Notes/",
    title = " Global note ",
    additional_presets = {
      project_local = {
        command_name = "ProjectNote",
        filename = function() return get_project_name_cwd() .. ".md" end,
        title = function() return " Note for project " .. get_project_name_cwd() .. " " end,
      },
      project_repo = {
        command_name = "RepoNote",
        filename = function() return get_project_name_git() .. ".md" end,
        title = function() return " Note for repository " .. get_project_name_git() .. " " end,
      },
      project_branch = {
        command_name = "BranchNote",
        filename = function() return get_project_name_git_branch() .. ".md" end,
        title = function() return " Note for branch " .. get_project_name_git_branch() .. " " end,
      },
    },
  },
}
