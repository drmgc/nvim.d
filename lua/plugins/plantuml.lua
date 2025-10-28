-- Soil for a plant (UML)
-- nvim-soil is a minimal plugin written in Lua for Plant UML.org-mode clone written in Lua for Neovim

---@module "nvim-soil"

---@type LazySpec
return {
  "javiorfo/nvim-soil",

  dependencies = { "javiorfo/nvim-nyctophilia" }, -- for puml syntax highlighting

  lazy = true,
  ft = "plantuml",
  opts = {
    actions = {
      -- This option closes the image viewer and reopen the image generated
      -- When true this offers some kind of online updating (like plantuml web server)
      redraw = true,
    },

    -- -- If you want to use Plant UML jar version instead of the installed version
    -- puml_jar = "/path/to/plantuml.jar",

    image = {
      darkmode = false,
      format = "png", -- Choose between png or svg

      -- This is a default implementation of using nsxiv to open the resultant image
      -- Edit the string to use your preferred app to open the image (as if it were a command line)
      -- Some examples:
      -- return "feh " .. img
      -- return "xdg-open " .. img
      -- execute_to_open = function(img) return "nsxiv -b " .. img end,
      execute_to_open = function(img) return "xdg-open " .. img end,
    },
  },
}
