--@type LazySpec

return {
  {
    "lalitmee/browse.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "stevearc/dressing.nvim",
    },
    opts = {
      provider = "duckduckgo",
      bookmarks = {
        ["github"] = {
          ["name"] = "search github from neovim",
          ["code_search"] = "https://github.com/search?q=%s&type=code",
          ["repo_search"] = "https://github.com/search?q=%s&type=repositories",
          ["issues_search"] = "https://github.com/search?q=%s&type=issues",
          ["pulls_search"] = "https://github.com/search?q=%s&type=pullrequests",
        },
      },
    },
    keys = {
      { "<Leader>sb", "<cmd>lua require('browse').browse()<cr>", desc = "BROWSE" },
    },
  },
}
