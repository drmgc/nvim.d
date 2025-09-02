-- org-mode clone written in Lua for Neovim

---@module "nvim-treesitter"

---@type LazySpec
return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      require("orgmode").setup {
        -- org_agenda_files = '~/orgfiles/**/*',
        -- org_default_notes_file = '~/orgfiles/refile.org',
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    ---@param opts TSConfig
    opts = function(_, opts)
      opts.ignore_install = require("astrocore").list_insert_unique(opts.ignore_install or {}, {
        "org",
      })
    end,
  },
}
