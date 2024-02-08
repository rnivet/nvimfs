-- Golang tools
return {
  "olexsmir/gopher.nvim",
  dependencies = { -- dependencies
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "BufReadPre", "BufNewFile" },
  build = ":GoInstallDeps",
}
