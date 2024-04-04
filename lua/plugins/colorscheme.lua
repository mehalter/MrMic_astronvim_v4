--@type LazySpec

return {
  {
    "navarasu/onedark.nvim",
    opts = {
      -- styles = dark, darker, cool, deep, warm, warmer, light
      -- toggle theme style ---
      toggle_style_key = "<Leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      -- toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer" }, -- List of styles to toggle between
    },
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    opts = {},
    name = "vscode",
  },
  {
    "martinsione/darkplus.nvim",
    lazy = false,
    name = "darkplus",
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "briones-gabriel/darcula-solid.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
}
