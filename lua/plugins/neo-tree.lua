return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.width = 60
    if opts.filesystem == nil then opts.filesystem = {} end
    if opts.filesystem.filtered_items == nil then opts.filesystem.filtered_items = {} end
    opts.filesystem.filtered_items.visible = true
    opts.filesystem.filtered_items.hide_dotfiles = true
    return opts
  end,
}
