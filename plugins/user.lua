return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_date_format = "%r"
      vim.g.gitblame_message_template = "		// <author>, <date> • <summary> • <sha>"

      -- set the mappings
      local utils = require "astronvim.utils"
      utils.set_mappings(astronvim.user_opts("mappings", {
        n = {
          ["<leader>go"] = { "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open Commit URL" }
        }
      }))
    end,
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    event = "BufReadPre",
    wants = "nvim-web-devicons",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup { use_diagnostic_signs = true }
      -- set the mappings
      local utils = require "astronvim.utils"
      utils.set_mappings(astronvim.user_opts("mappings", {
        n = {
          ["<leader>tt"] = { "<cmd>TroubleToggle<cr>", desc = "TroubleToggle" }
        }
      }))
    end,
    lazy = false,
  },
  {
    "lambdalisue/suda.vim",
    lazy = false
  },
  {
    "tpope/vim-surround",
    lazy = false
  },
  {
    "davvid/telescope-git-grep.nvim",
    lazy = false,
    config = function()
      require('telescope').load_extension('git_grep')
      -- set the mappings
      local utils = require "astronvim.utils"
      utils.set_mappings(astronvim.user_opts("mappings", {
        n = {
          ["<leader>fg"] = { function() require("git_grep").live_grep() end, desc = "Git find words" }
        }
      }))
    end
  },
}
