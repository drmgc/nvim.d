local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'tsserver'},
  handlers = {
    lsp_zero.default_setup,
    
    tsserver = function()
      require('lspconfig').tsserver.setup({
        single_file_support = false,
        on_attach = function(client, bufnr)
          print('hello tsserver')
        end
      })
    end,
  },
})
