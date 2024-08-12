return {
  "nvim-pack/nvim-spectre",
  lazy = true,
  cmd = { "Spectre" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "catppuccin/nvim",
  },
  config = function()
    local theme = require("catppuccin.palettes").get_palette("macchiato")

    vim.api.nvim_set_hl(0, "SpectreSearch", { bg = theme.red, fg = theme.base })
    vim.api.nvim_set_hl(0, "SoutlinepectreReplace", { bg = theme.green, fg = theme.base })

    require("spectre").setup({
      highlight = {
        search = "SpectreSearch",
        replace = "SpectreReplace",
      },
    })
  end,
}
