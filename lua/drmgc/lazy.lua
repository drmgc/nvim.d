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
  -- colorschemes
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {} },
  { 'Th3Whit3Wolf/one-nvim', priority = 1000, lazy = false },

  -- command helpers
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  -- telescope
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim', 'ThePrimeagen/harpoon' }, config = function()
      local harpoon = require("harpoon")

      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
              results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set("n", "<leader><leader>h",
        function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })

      vim.keymap.set('n', 'fr',
        function() require('telescope.builtin').lsp_references() end,
        { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>f",
        function() require('telescope.builtin').find_files() end,
        { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>b",
        function()
          require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))
        end,
        { noremap = true, silent = true })

    end },

  -- lsp-zero
  { 'illiamboman/mason.nvim' },
  { 'illiamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },

  -- snippets
  { 'L3MON4D3/LuaSnip' },

  { 'ThePrimeagen/harpoon', branch = 'harpoon2',
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end) 

      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end) 
    end, },

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
    end,
  },

  { 'nvim-tree/nvim-tree.lua', opts = {
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  } },

  { 'nvim-tree/nvim-web-devicons' },

  { 'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end }, -- welcome screen

  -- ledger
  { 'ledger/vim-ledger' },
}

require('lazy').setup(plugins, opts)

