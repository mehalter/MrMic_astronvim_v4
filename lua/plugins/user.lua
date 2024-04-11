-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  --------------------------------------------------------------------
  {
    "folke/todo-comments.nvim",
    --   requires = "nvim-lua/plenary.nvim",
    --   -- config = function() require("todo-comments").setup {} end,
    opts = {},
    event = { "User AstroFile" },
    cmd = { "TodoQuickFix" },
    keys = {
      {
        "<Leader>T",
        "<cmd>TodoTelescope keywords=TODO,FIX,NOTE,HACK,REVIEW,WARNING,PERF,BUG<cr>",
        desc = "TODO-COMMENTS Telescope",
      },
    },
  },
  {
    "luukvbaal/nnn.nvim",
    -- config = function() require("nnn").setup() end,
    config = function(_, opts) require("nnn").setup(opts) end,
    opts = {
      picker = {
        -- cmd = "tmux new-session yazi ",
        cmd = "tmux new-session nnn -Pp",
        -- cmd = "zellij r -f -c -- nnn -Pp",
        style = { border = "rounded" },
        session = "shared",
      },
      replace_netrw = "picker",
      -- windownav = "<C-l>",
    },
    event = { "User AstroFile" },
    keys = {
      -- { "<F11>", "<cmd>NnnExplorer %:p:h<cr>", desc = "Open nnn Explorer" },
      { "<F12>", "<cmd>NnnPicker<cr>", desc = "Open nnn Picker" },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    -- config = function() vim.keymap.set("n", "<C-h>", "<cmd>:TmuxNavigateLeft<cr>") end,
  },
  {
    "s1n7ax/nvim-window-picker",
    -- tag = "v1.*",
    lazy = false,
    config = function(_, opts) require("window-picker").setup(opts) end,
    opts = {
      vim.keymap.set("n", "<leader>*", function()
        local picker = require "window-picker"
        local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
      end, { desc = "Pick a window" }),
    },
    -- config = function()
    --     require'window-picker'.setup()
    -- end,
  },
  {
    "mg979/vim-visual-multi",
    config = function() end,
    event = { "User AstroFile" },
  },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>j",
        "<CMD>TSJToggle<CR>",
        desc = "Toggle TreeSitter join",
      },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    opts = {},
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup {
        default_mappings = true,
      }
    end,
    event = "User AstroFile",
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "User AstroFile",
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {
    "nvim-neotest/neotest",
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup {
        -- your neotest config here
        adapters = {
          require "neotest-go",
          require "neotest-rust",
          require "neotest-python" {
            python = "/home/mic/.pyenv/shims/python",
          },
          require "neotest-jest" {
            jestCommand = "npx jest",
            jestConfigFile = "package.json",
            env = { CI = true },
            cwd = function(_path) return vim.fn.getcwd() end,
          },
        },
      }
    end,
    ft = { "go", "rust", "python", "typescript" },
    dependencies = {
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      "haydenmeade/neotest-jest",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<leader>d" .. "l",
        "<cmd>lua require('neotest').run.run_last()<CR>",
        desc = "Run Last Test",
      },
      {
        "<leader>d" .. "m",
        "<cmd>lua require('neotest').run.run()<CR>",
        desc = "Run Nearest Test",
      },
      {
        "<leader>d" .. "f",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
        desc = "Run all File Tests",
      },
      {
        "<leader>d" .. "d",
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
        desc = "Debug Nearest Test",
      },
      {
        "<leader>d" .. "S",
        "<cmd>lua require('neotest').summary.toggle()<CR>",
        desc = "Toggle Tests Summary",
      },
      {
        "<leader>d" .. "O",
        "<cmd>lua require('neotest').output.open({ enter = true })<CR>",
        desc = "Toggle Output Panel",
      },
    },
  },
  {
    {
      "ggandor/flit.nvim",
      keys = function()
        ---@type LazyKeys[]
        local ret = {}
        for _, key in ipairs { "f", "F", "t", "T" } do
          ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
        end
        return ret
      end,
      opts = { labeled_modes = "nx" },
      dependencies = {
        "ggandor/leap.nvim",
        keys = {
          { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
          { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
          { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
          local leap = require "leap"
          for k, v in pairs(opts) do
            leap.opts[k] = v
          end
          leap.add_default_mappings(true)
        end,
        dependencies = {
          "tpope/vim-repeat",
        },
      },
    },
  },

  {
    "Shatur/neovim-ayu",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh yarn",
    config = true,
    opts = {},
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
  },
  {
    "smzm/hydrovim",
    ft = {
      "python",
    },
  },
  {
    "roobert/search-replace.nvim",
    event = "VeryLazy",
    config = function()
      require("search-replace").setup {
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      }
    end,
    keys = {
      { "<f4>", desc = "Search_Replace" },
      {
        "<f4>" .. "s",
        "<cmd>SearchReplaceSingleBufferCExpr<CR>",
        desc = "Search_Replace CExpr",
      },
    },
  },
  {
    {
      "rest-nvim/rest.nvim",
      ft = { "http", "json" },
      cmd = {
        "RestNvim",
        "RestNvimPreview",
        "RestNvimLast",
      },
      dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
        { "<Leader>r" .. "n", desc = "RestNvim" },
        { "<Leader>r" .. "s", "<Plug>RestNvim", desc = "Run request" },
      },
      opts = {},
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup {
        -- Configuration here, or leave empty to use defaults
        -- font = "VictorMono NF=34;Noto Emoji=34",
        font = "JetBrainsMono Nerd Font=34;Noto Emoji=34",
      }
    end,
  },
  {
    "kevinhwang91/rnvimr",
    event = "VeryLazy",
    keys = {
      { "<leader>Og", "<cmd>RnvimrToggle<cr>", desc = "RnvimrToggle" },
    },
  },
}
