return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        filetypes = {
          "css",
          "javascript",
          html = { mode = "foreground" },
        },
      })
    end,
  },
}
