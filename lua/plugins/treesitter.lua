return {
  {

    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "lua",
          "vim",
          "javascript",
          "html",
          "css",
          "scss",
          "bash",
          "tsx",
          "comment",
          "dockerfile",
          "go",
          "json",
          "php",
          "proto",
          "regex",
          "solidity",
          "sql",
          "toml",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },
}
