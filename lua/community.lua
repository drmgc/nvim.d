-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.godot" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.ocaml" },
  -- { import = "astrocommunity.pack.jj" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.programming-language-support.rest-nvim" },

  { import = "astrocommunity.git.diffview-nvim" },

  { import = "astrocommunity.motion.leap-nvim" },

  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },

  { import = "astrocommunity.recipes.neovide" },
}
