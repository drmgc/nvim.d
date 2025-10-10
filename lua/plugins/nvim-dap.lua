---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "js-debug-adapter")
      end,
    },
  },
  config = function()
    local dap = require "dap"
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- TODO: Make sure this path is not like this when pushing
        args = {
          vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }
    -- opts.configurations.javascript = {
    --   {
    --     type = "pwa-node",
    --     request = "launch",
    --     name = "Launch file",
    --     program = "${file}",
    --     cwd = "${workspaceFolder}",
    --   },
    -- }
  end,
}
