vim.opt.termguicolors = true

vim.api.nvim_create_user_command('Light',
  function()
    vim.opt.background = 'light'
    vim.cmd[[colorscheme one-nvim]]
  end,
  { nargs = 0 })

vim.api.nvim_create_user_command( 'Dark',
  function()
    vim.opt.background = 'dark'
    vim.cmd[[colorscheme tokyonight]]
  end,
  { nargs = 0 })

vim.cmd.Light()

