local envs = require "drmgc.envs"

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  opts = function(_, opts)
    opts.config["typescript-tools"].settings.tsserver_file_preferences = {
      importModuleSpecifierPreference = envs.ts.importModuleSpecifierPreference or "relative",
      importModuleSpecifierEnding = "minimal",
      insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
    }
    return opts -- return final config table
  end,
}
