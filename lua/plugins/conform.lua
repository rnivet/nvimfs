-- The formatting plugin
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        go = { "gofumpt", "goimports_reviser" },
      },
      formatters = {
        goimports_reviser = {
          command = "goimports-reviser",
          args = { "-project-name", "gitlabdev.vadesecure.com", "$FILENAME" },
          stdin = false,
        }
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      }
    })
  end
}
