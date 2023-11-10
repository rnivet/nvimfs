return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.TRACE,
    })
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "lua_ls",                          -- Lua LS
        "pylsp",                           -- Python LS
        "pyright",                         -- Another Python LS
        "yamlls",                          -- YAML LS
        "html",                            -- HTML LS
        "cssls",                           -- CSS LS
        "gopls",                           -- GO LS
        "spectral",                        -- Openapi LS
        "ansiblels",                       -- Ansible LS
        "dockerls",                        -- Docker LS
        "docker_compose_language_service", -- Docker compose LS
        "phpactor",                        -- PHP LS
        "jsonls"                           -- JSON LS
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })
  end,
}
