local envs = require "drmgc.envs"

if not envs.enable_copilot then return {} end

return {
  "zbirenbaum/copilot.lua",
  cond = function()
    if not envs.enable_copilot then return false end

    vim.notify "Copilot shall be enabled"

    return true
  end,
  opts = function(_, opts)
    opts.filetypes = {
      -- allow specific filetype
      javascript = true,
      typescript = true,
      ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
    }
    return opts
  end,
}
