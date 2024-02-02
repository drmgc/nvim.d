local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {} },
  { 'Th3Whit3Wolf/one-nvim', priority = 1000, lazy = false },

  -- lsp-zero
  { 'illiamboman/mason.nvim' },
  { 'illiamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },

  { 'JoosepAlviste/nvim-ts-context-commentstring' },

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' } },

  
  { 'numToStr/Comment.nvim', dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    lazy = false,
    config = function()
      require('Comment').setup({})
    end
  },

  { 'mbbill/undotree' },
  { 'tpope/vim-fugitive' },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
          -- Configuration here, or leave empty to use defaults
      })
    end
  },

  { 'nvim-tree/nvim-web-devicons' },

  { 'goolord/alpha-nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, event = 'VimEnter', config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end },
}

require('lazy').setup(plugins, opts)

