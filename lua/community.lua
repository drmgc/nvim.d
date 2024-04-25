-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

local envs = require "envs"

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.godot" },
  { import = "astrocommunity.completion.copilot-lua", cond = envs.enable_copilot },
  { import = "astrocommunity.completion.copilot-lua-cmp", cond = envs.enable_copilot },
}
