return {
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      disabled_filetypes = {
        "netrw",
        "NvimTree",
        "Lazy",
        "mason",
        "help",
        "text",
        "markdown",
        "tex",
        "html",
      },
      scope = "window",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  "windwp/nvim-ts-autotag",
}
