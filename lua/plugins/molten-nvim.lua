-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local use_community = true -- Set to true to use the community plugin spec

if use_community then
  local function ensure_kernel_for_venv()
    local venv_path = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX"
    if not venv_path then
      print "No virtual environment found."
      return
    end

    -- Canonicalize the venv_path to ensure consistency
    venv_path = vim.fn.fnamemodify(venv_path, ":p")

    -- Check if the kernel spec already exists
    local handle = io.popen "jupyter kernelspec list --json"
    local existing_kernels = {}
    if handle then
      local result = handle:read "*a"
      handle:close()
      local json = vim.fn.json_decode(result)
      -- Iterate over available kernel specs to find the one for this virtual environment
      for kernel_name, data in pairs(json.kernelspecs) do
        existing_kernels[kernel_name] = true -- Store existing kernel names for validation
        local kernel_path = vim.fn.fnamemodify(data.spec.argv[1], ":p") -- Canonicalize the kernel path
        if kernel_path:find(venv_path, 1, true) then
          print "Kernel spec for this virtual environment already exists."
          return kernel_name
        end
      end
    end

    -- Prompt the user for a custom kernel name, ensuring it is unique
    local new_kernel_name
    repeat
      new_kernel_name = vim.fn.input "Enter a unique name for the new kernel spec: "
      if new_kernel_name == "" then
        print "Please provide a valid kernel name."
        return
      elseif existing_kernels[new_kernel_name] then
        print("Kernel name '" .. new_kernel_name .. "' already exists. Please choose another name.")
        new_kernel_name = nil
      end
    until new_kernel_name

    -- Create the kernel spec with the unique name
    print "Creating a new kernel spec for this virtual environment..."
    local cmd = string.format(
      '%s -m ipykernel install --user --name="%s" --display-name="%s"',
      vim.fn.shellescape(venv_path .. "/bin/python"),
      new_kernel_name,
      new_kernel_name
    )

    os.execute(cmd)
    print(string.format("Kernel spec '%s' created successfully.", new_kernel_name))
    return new_kernel_name
  end

  ---@type LazySpec
  return {
    -- Import the Molten plugin from the AstroNvim community
    { import = "astrocommunity.code-runner.molten-nvim" },
    {
      -- further customize the options set by the community
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            -- next/prec cell: MoltenNext, MoltenPrev
            ["<Leader>m"] = { desc = "󱓞 Molten" },
            ["<Leader>mh"] = { "<Cmd>MoltenHideOutput<CR>", desc = "Hide Output" },
            ["<Leader>mm"] = { desc = "Commands" },
            ["<Leader>mmI"] = { "<Cmd>MoltenInterrupt<CR>", desc = "Interrupt Kernel" },
            ["<Leader>mmR"] = { "<Cmd>MoltenRestart<CR>", desc = "Restart Kernel" },
            ["<Leader>mr"] = { desc = "Evaluate" },
            ["]c"] = { "<Cmd>MoltenNext<CR>", desc = "Next Molten Cel" },
            ["[c"] = { "<Cmd>MoltenPrev<CR>", desc = "Previous Molten Cell" },
            -- Dynamic Kernel Initialization based on Virtual Environment
            ["<Leader>mi"] = {
              function()
                local kernel_name = ensure_kernel_for_venv()
                vim.cmd(("MoltenInit %s"):format(kernel_name))
              end,
              desc = "Initialize Molten for Python",
              silent = true,
            },
          },
          v = {
            ["<Leader>m"] = { desc = "󱓞 Molten" },
          },
        },
      },
    },

    -- Configure heirline.nvim to add the Molten status component
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local utils = require "heirline.utils"
        local molten_component = {
          provider = function()
            -- Display the status of Molten and attached kernels
            local init_status = require("molten.status").initialized()
            local kernel_status = require("molten.status").kernels()
            local info = (init_status ~= "" and init_status .. ": ") .. kernel_status
            return info ~= "" and info or ""
          end,
          condition = function() return require("molten.status").initialized() ~= "" end,
          padding = { left = 1, right = 1 },
          hl = function()
            local theme_hl = utils.get_highlight "@comment.note"
            return {
              bg = theme_hl.bg,
              fg = theme_hl.fg,
            }
          end,
        }
        local spacer = { provider = " " }
        table.insert(opts.statusline, #opts.statusline, spacer)
        table.insert(opts.statusline, #opts.statusline, molten_component)
      end,
    },
  }
end

-- WARN: this is a custom plugin spec loaded when `use_community` is set to false

---@type LazySpec
return {}
