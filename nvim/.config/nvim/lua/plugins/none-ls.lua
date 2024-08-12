return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    -- Configure LSP linting, formatting, diagnostics and code actions
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    -- local code_actions = null_ls.builtins.code

    null_ls.setup({
      border = "rounded",
      sources = {
        -- formatting
        formatting.stylua,
        formatting.clang_format,

        -- diagnostics
        diagnostics.cppcheck,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
