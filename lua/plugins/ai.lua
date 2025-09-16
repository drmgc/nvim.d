local envs = require "drmgc.envs"

if not envs.enable_copilot then return {} end

return {
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.editing-support.codecompanion-nvim" },
  {
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
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"

      if not opts.mapping then opts.mapping = {} end

      -- -- I don't like Copilot completing suggestions when I wanted to just complete a word or insert snippet
      -- -- https://github.com/AstroNvim/astrocommunity/blob/7286c279d32802c04ad3677b8dac969215b30e33/lua/astrocommunity/completion/copilot-lua-cmp/init.lua#L15
      -- opts.mapping["<Tab>"] = nil

      opts.mapping["<M-a>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        else
          fallback()
        end
      end, { "i", "s" })

      return opts
    end,
  },
}
