return {
  "azabiong/vim-highlighter",
  lazy = false, -- Not Lazy by default
  init = function()
    vim.cmd [[
     let HiSet   = 'ù<CR>'
     let HiErase = 'ù<BS>'
     let HiClear = 'ù<C-F3>'
     let HiFind  = 'ù<Tab>'
     let HiSetSL = 't<CR>'
 ]]
  end,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["nn"] = { "<Cmd>hi><CR>", desc = "Next Recently Set Highlight" },
            ["ng"] = { "<Cmd>Hi<<CR>", desc = "Previous Recently Set Highlight" },
            ["n["] = { "<Cmd>Hi{<CR>", desc = "Next Nearest Highlight" },
            ["n]"] = { "<Cmd>Hi}<CR>", desc = "Previous Nearest Highlight" },
          },
        },
      },
    },
  },
}
