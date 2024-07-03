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
    "github/copilot.vim",
    config = function()
      vim.cmd('imap <silent><script><expr> <C-CR> copilot#Accept("\\<CR>")')
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_enabled = false
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  "windwp/nvim-ts-autotag",
}
