-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
--Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        ["<leader>R"] = { name = "RUN" },
        ["<leader>Rr"] = { name = "RUST" },
        ["<leader>Rrr"] = { "<cmd>RustRun<cr>", desc = "Run RUST" },
        ["<leader>RrR"] = { "<cmd>RustRunnable<cr>", desc = "Runnable RUST" },
        ["<leader>Rri"] = { "<cmd>RustSetInlayHints<cr>", desc = "Rust Set Inlay Hints" },
        ["<leader>RrI"] = { "<cmd>RustUnsetInlayHints<cr>", desc = "Rust Unset Inlay Hints" },
        ["<leader>Rrc"] = { "<cmd>RustOpenCargo<cr>", desc = "Rust Open Cargo" },
        ["<leader>Rrg"] = { "<cmd>RustViewCrateGraph<cr>", desc = "Rust View Crate Graph" },
        ["<C-F3>"] = { "<cmd>RustEnableInlayHints<cr>", desc = "Enable Inlay Hints" },
        ["<C-F4>"] = { "<cmd>RustDisableInlayHints<cr>", desc = "Disable Inlay Hints" },

        ["<leader>Rf"] = { name = "FLUTTER" },
        ["<leader>Rfr"] = { "<cmd>FlutterRun<cr>", desc = "Run Flutter" },
        ["<leader>RfR"] = { "<cmd>FlutterRestart<cr>", desc = "Restart Flutter" },
        ["<leader>Rfl"] = { "<cmd>FlutterReload<cr>", desc = "Reload Flutter" },
        ["<leader>Rfd"] = { "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
        ["<leader>Rfe"] = { "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
        ["<leader>Rfg"] = { "<cmd>FlutterPubGet<cr>", desc = "Flutter PubGet" },
        ["<leader>Rfu"] = { "<cmd>FlutterPubUpgrade<cr>", desc = "Flutter PubUpgrade" },
        ["<leader>Rfq"] = { "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },

        ["<leader>Rg"] = { name = "GOLANG" },
        ["<leader>Rgi"] = { "<cmd>GoImpl<cr>", desc = "Go Impl Interface" },
        ["<leader>Rga"] = { "<cmd>GoTagAdd<cr>", desc = "Add Tag (json | yaml)" },
        ["<leader>Rgr"] = { "<cmd>GoTagRm<cr>", desc = "Remove Tag (json | yaml)" },
        ["<leader>Rgg"] = { "<cmd>GoGet<cr>", desc = "Go Get package (url)" },
        ["<leader>Rgd"] = { "<cmd>GoCmt<cr>", desc = "Generate Doc Comment" },

        ["<leader>Ro"] = { name = "OVERSEER" },
        ["<leader>Ror"] = { "<cmd>OverseerRun<cr>", desc = "Overseer Run" },
        ["<leader>Rot"] = { "<cmd>OverseerToggle<cr>", desc = "Overseer Toggle" },
        ["<F8>"] = { "<cmd>OverseerToggle<cr>", desc = "Overseer Toggle" },
        ["<leader>Roo"] = { "<cmd>OverseerOpen<cr>", desc = "Overseer Open" },

        ["<leader>Rc"] = { name = "COMPILER" },
        ["<leader>Rco"] = { "<cmd>CompilerOpen<cr>", desc = "Compiler Open" },
        ["<leader>Rct"] = { "<cmd>CompilerToggleResults<cr>", desc = "Compiler Toggle Results" },

        ["<leader>Rd"] = { name = "DBUI" },
        ["<leader>Rdc"] = { "<cmd>DBUIClose<cr>", desc = "DBUI Close" },
        ["<leader>Rda"] = { "<cmd>DBUIAddConnection<cr>", desc = "DBUI Add Connection" },
        ["<leader>Rdt"] = { "<cmd>DBUIToggle<cr>", desc = "DBUI Toggle" },

        ["<C-w>M"] = { "<cmd>WindowsMaximize<cr>", desc = "Maximize Window" },
        ["<C-w>E"] = { "<cmd>WindowsEqualize<cr>", desc = "Equalize Window" },

        ["<leader>B"] = { name = "Comment Box" },
        ["<leader>Bb"] = { name = "BOX" },
        ["<leader>Bbl"] = { "<cmd>CBllbox<cr>", desc = "Left Commented Box" },
        ["<leader>Bbc"] = { "<cmd>CBccbox<cr>", desc = "Centered Commented Box" },
        ["<leader>Bl"] = { name = "LINE" },
        ["<leader>Bl2"] = { "<cmd>CBcline2<cr>", desc = "Line Simple Heavy" },
        ["<leader>Bc"] = { name = "CHAINSAW" },
        ["<leader>Bcv"] = {
          function() require("chainsaw").variableLog() end,
          desc = "Chainsaw - Variable Log",
        },
        ["<leader>Bco"] = {
          function() require("chainsaw").objectLog() end,
          desc = "Chainsaw - Object Log",
        },
        ["<leader>Bct"] = {
          function() require("chainsaw").timeLog() end,
          desc = "Chainsaw - Time Log",
        },
        ["<leader>Bcr"] = {
          function() require("chainsaw").removeLogs() end,
          desc = "Chainsaw - Remove Log",
        },

        ["<leader>fg"] = { name = "Live GREP" },
        ["<leader>fgg"] = {
          ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
          desc = "Live Grep",
        },
        ["<leader>fgc"] = {
          function() require("telescope-live-grep-args.shortcuts").grep_word_under_cursor() end,
          desc = "Live Grep Word Under Cursor",
        },
        ["<F3>"] = { "<cmd>Telescope projects<CR>", desc = "Telescope Project" },
        ["<leader>tz"] = {
          -- "<cmd>TermExec cmd=zellij name=zellij<cr>",
          function()
            local utils = require "astronvim.utils"
            utils.toggle_term_cmd "zellij"
          end,
          desc = "ToggleTerm Zellij",
        },
        ["<leader>ta"] = {
          "<cmd>ToggleTerm direction=tab name=Tab<CR>",
          desc = "ToggleTerm TAB",
        },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
