return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        custom_highlights = function(colors)
          return {
            LineNr = { fg = colors.peach },
            LineNrAbove = { fg = colors.subtext1 },
            LineNrBelow = { fg = colors.subtext1 },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
