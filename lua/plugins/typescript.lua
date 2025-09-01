local envs = require "drmgc.envs"

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    opts.config["typescript-tools"].settings.tsserver_file_preferences = {
      importModuleSpecifierPreference = envs.ts.importModuleSpecifierPreference or "relative",
      importModuleSpecifierEnding = "minimal",
      insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
    }
    return opts
  end,
}
