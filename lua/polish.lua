-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.opt.spelllang = "en_us,ru"
vim.opt.spelloptions = "camel"
vim.opt.spell = true

require("lspconfig").gdscript.setup { cmd = { "ncat", "localhost", "6005" } }

require("lspconfig").tsserver.setup {
  init_options = {
    preferences = {
      -- other preferences...
      importModuleSpecifierPreference = "relative",
      importModuleSpecifierEnding = "minimal",
    },
  },
}
