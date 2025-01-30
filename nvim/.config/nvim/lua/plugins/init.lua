return {
  -- Conform
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Outline Tab
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
      require("outline").setup {}
    end,
  },

  -- Rustaceanvim
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    keys = {
      { "<leader>rem", "<cmd>RustLsp expandMacro<cr>", desc = "Rust Expand Macro" },
    },
  },

  -- Crates Managing
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  -- Inlay Hints
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    config = function()
      require("inlay-hints").setup()
    end,
  },

  -- Indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    main = "ibl",
    opts = {},
    lazy = false,
    config = function()
      require "configs.indentation"
    end,
  },

  -- Lazygit
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },

    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  -- Vim Visual Multi
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
  },

  -- Discord Rich Presence
  {
    "andweeb/presence.nvim",
    branch = "main",
    event = "BufReadPre",
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
