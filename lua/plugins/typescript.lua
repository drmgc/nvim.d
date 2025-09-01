local envs = require "drmgc.envs"

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    -- opts.servers = opts.servers or {}
    -- opts.servers = require("astrocore").list_insert_unique(opts.servers, { "ts_ls" })

    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      ---@type lspconfig.options.ts_ls
      ---@diagnostic disable: missing-fields
      ts_ls = {
        init_options = {
          preferences = {
            importModuleSpecifierPreference = envs.ts.importModuleSpecifierPreference or "relative",
            importModuleSpecifierEnding = "minimal",
            insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
          },
        },
      },
    })
    return opts
  end,
}
