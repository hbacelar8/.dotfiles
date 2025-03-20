local configs = require "nvchad.configs.lspconfig"
local map = vim.keymap.set

local servers = {
  cmake = {
    on_attach = configs.on_attach,
  },
  clangd = {
    on_attach = function(client, bufnr)
      client.server_capabilities.signatureHelpProvider = false

      local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
      end

      -- Custom keymap
      map("n", "<leader>sch", "<cmd>ClangdSwitchSourceHeader<cr>", opts "Switch Source/Header (C/C++)")
    end,
    settings = {
      clangd = {
        InlayHints = {
          Designators = true,
          Enabled = true,
          ParameterNames = true,
          DeducedTypes = true,
        },
        fallbackFlags = { "-std=c++20" },
      },
    },
    root_dir = function(fname)
      return require("lspconfig.util").root_pattern(
        "Makefile",
        "configure.ac",
        "configure.in",
        "config.h.in",
        "meson.build",
        "meson_options.txt",
        "build.ninja"
      )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or require(
        "lspconfig.util"
      ).find_git_ancestor(fname)
    end,
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup {
    on_init = opts.on_init,
    capabilities = opts.capabilities,
    settings = opts.settings,

    on_attach = function(client, bufnr)
      opts.on_attach(client, bufnr)
      configs.on_attach(client, bufnr)
    end,
  }
end
