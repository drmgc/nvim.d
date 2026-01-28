return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      backdrop = 1,
      width = function() return math.min(120, vim.o.columns * 0.75) end,
      height = 0.9,
      options = {
        number = true,
        relativenumber = true,
        foldcolumn = "1",
        list = false,
        showbreak = "NONE",
        signcolumn = "no",
      },
    },
    plugins = {
      options = {
        cmdheight = 0,
        laststatus = 3,
        showcmd = true,
        ruler = true,
      },
    },
  },
}
