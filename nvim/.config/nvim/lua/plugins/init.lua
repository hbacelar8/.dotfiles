return {
  -- Conform
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
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

  -- Inlay Hints
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    config = function()
      require("inlay-hints").setup()
    end,
  },

  -- Rustaceanvim
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      ensure_installed = {
        "c",
        "cpp",
        "cmake",
        "rust",
      },
    },
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
}
