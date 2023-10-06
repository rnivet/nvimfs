-- Code highlight plugin
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- import module
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      highlight = {
        enable = true
      },
      indent = {
        disable = true
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
      },
      -- auto install above language parsers
      auto_install = true
    })
  end
}
