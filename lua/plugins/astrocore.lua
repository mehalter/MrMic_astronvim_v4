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
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        ---------------------------------------------------------------------------

        ["<Leader>R"] = { name = "RUN" },
        ["<Leader>Rr"] = { name = "RUST" },
        ["<Leader>Rrr"] = { "<cmd>RustRun<cr>", desc = "Run RUST" },
        ["<Leader>RrR"] = { "<cmd>RustRunnable<cr>", desc = "Runnable RUST" },
        ["<Leader>Rri"] = { "<cmd>RustSetInlayHints<cr>", desc = "Rust Set Inlay Hints" },
        ["<Leader>RrI"] = { "<cmd>RustUnsetInlayHints<cr>", desc = "Rust Unset Inlay Hints" },
        ["<Leader>Rrc"] = { "<cmd>RustOpenCargo<cr>", desc = "Rust Open Cargo" },
        ["<Leader>Rrg"] = { "<cmd>RustViewCrateGraph<cr>", desc = "Rust View Crate Graph" },

        ["<Leader>Rf"] = { name = "FLUTTER" },
        ["<Leader>Rfr"] = { "<cmd>FlutterRun<cr>", desc = "Run Flutter" },
        ["<Leader>RfR"] = { "<cmd>FlutterRestart<cr>", desc = "Restart Flutter" },
        ["<Leader>Rfl"] = { "<cmd>FlutterReload<cr>", desc = "Reload Flutter" },
        ["<Leader>Rfd"] = { "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
        ["<Leader>Rfe"] = { "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
        ["<Leader>Rfg"] = { "<cmd>FlutterPubGet<cr>", desc = "Flutter PubGet" },
        ["<Leader>Rfu"] = { "<cmd>FlutterPubUpgrade<cr>", desc = "Flutter PubUpgrade" },
        ["<Leader>Rfq"] = { "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },

        ["<Leader>Rg"] = { name = "GOLANG" },
        ["<Leader>Rgi"] = { "<cmd>GoImpl<cr>", desc = "Go Impl Interface" },
        ["<Leader>Rga"] = { "<cmd>GoTagAdd<cr>", desc = "Add Tag (json | yaml)" },
        ["<Leader>Rgr"] = { "<cmd>GoTagRm<cr>", desc = "Remove Tag (json | yaml)" },
        ["<Leader>Rgg"] = { "<cmd>GoGet<cr>", desc = "Go Get package (url)" },
        ["<Leader>Rgd"] = { "<cmd>GoCmt<cr>", desc = "Generate Doc Comment" },

        ["<Leader>Ro"] = { name = "OVERSEER" },
        ["<Leader>Roa"] = { "<cmd>OverseerTaskAction<cr>", desc = "Overseer Task Action" },
        ["<Leader>Roc"] = { "<cmd>OverseerRunCmd<cr>", desc = "Overseer Run Cmd" },
        ["<Leader>Roi"] = { "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
        ["<Leader>Ror"] = { "<cmd>OverseerRun<cr>", desc = "Overseer Run" },
        ["<Leader>Rot"] = { "<cmd>OverseerToggle<cr>", desc = "Overseer Toggle" },
        ["<Leader>Roq"] = { "<cmd>OverseerQuickAction<cr>", desc = "Overseer Quick Action" },
        ["<F8>"] = { "<cmd>OverseerToggle<cr>", desc = "Overseer Toggle" },
        ["<Leader>Roo"] = { "<cmd>OverseerOpen<cr>", desc = "Overseer Open" },

        ["<Leader>Rc"] = { name = "COMPILER" },
        ["<Leader>Rco"] = { "<cmd>CompilerOpen<cr>", desc = "Compiler Open" },
        ["<Leader>Rct"] = { "<cmd>CompilerToggleResults<cr>", desc = "Compiler Toggle Results" },

        ["<Leader>Rd"] = { name = "DBUI" },
        ["<Leader>Rdc"] = { "<cmd>DBUIClose<cr>", desc = "DBUI Close" },
        ["<Leader>Rda"] = { "<cmd>DBUIAddConnection<cr>", desc = "DBUI Add Connection" },
        ["<Leader>Rdt"] = { "<cmd>DBUIToggle<cr>", desc = "DBUI Toggle" },

        ["<C-w>M"] = { "<cmd>WindowsMaximize<cr>", desc = "Maximize Window" },
        ["<C-w>E"] = { "<cmd>WindowsEqualize<cr>", desc = "Equalize Window" },

        ["<Leader>B"] = { name = "Comment Box" },
        ["<Leader>Bb"] = { name = "BOX" },
        ["<Leader>Bbl"] = { "<cmd>CBllbox<cr>", desc = "Left Commented Box" },
        ["<Leader>Bbc"] = { "<cmd>CBccbox<cr>", desc = "Centered Commented Box" },
        ["<Leader>Bl"] = { name = "LINE" },
        ["<Leader>Bl2"] = { "<cmd>CBcline2<cr>", desc = "Line Simple Heavy" },

        ["<Leader>Bc"] = { name = "CHAINSAW" },
        ["<Leader>Bcv"] = {
          function() require("chainsaw").variableLog() end,
          desc = "Chainsaw - Variable Log",
        },
        ["<Leader>Bco"] = {
          function() require("chainsaw").objectLog() end,
          desc = "Chainsaw - Object Log",
        },
        ["<Leader>Bct"] = {
          function() require("chainsaw").timeLog() end,
          desc = "Chainsaw - Time Log",
        },
        ["<Leader>Bcr"] = {
          function() require("chainsaw").removeLogs() end,
          desc = "Chainsaw - Remove Log",
        },

        ["<Leader>fg"] = { name = "Live GREP" },
        ["<Leader>fgg"] = {
          ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
          desc = "Live Grep",
        },
        ["<Leader>fgc"] = {
          function() require("telescope-live-grep-args.shortcuts").grep_word_under_cursor() end,
          desc = "Live Grep Word Under Cursor",
        },

        ["<F3>"] = { "<cmd>Telescope projects<CR>", desc = "Telescope Project" },

        ["<Leader>tz"] = {
          -- "<cmd>TermExec cmd=zellij name=zellij<cr>",
          function()
            local utils = require "astrocore"
            utils.toggle_term_cmd "zellij"
          end,
          desc = "ToggleTerm Zellij",
        },
        ["<Leader>ta"] = {
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
