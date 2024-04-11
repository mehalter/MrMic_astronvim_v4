--@type LazySpec

return {
  {
    "topaxi/gh-actions.nvim",
    cmd = "GhActions",
    keys = {
      { "<Leader>gH", "<cmd>GhActions<cr>", desc = "Open Github Actions" },
    },
    -- optional, you can also install and use `yq` instead.
    build = "make",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    opts = {},
    config = function(_, opts) require("gh-actions").setup(opts) end,
  },
}
