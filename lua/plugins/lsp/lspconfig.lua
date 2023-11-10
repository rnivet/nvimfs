-- LSP client configs as a plugin
-- Use lsp-format to trigger formatting using LSP formatter
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nvimdev/lspsaga.nvim"
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp_nvim_lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP finder"
      keymap.set("n", "gf", "<cmd>Lspsaga finder <CR>", opts) -- show definition, references

      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Lspsaga finder ref<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts) -- show lsp type definitions

      opts.desc = "Show LSP outline"
      keymap.set("n", "go", "<cmd>Lspsaga outline<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "d<", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "d>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- configure lua_ls server
    lspconfig.lua_ls.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach,
      settings = {
        Lua = {
          -- make LS recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make LS aware of runtime files
            library = {
              vim.env.VIMRUNTIME
            }
          }
        }
      }
    })

    -- configure pylsp server
    lspconfig.pylsp.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure pyright server
    lspconfig.pyright.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure yamlls server
    lspconfig.yamlls.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach,
    })

    -- configure html server
    lspconfig.html.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure cssls server
    lspconfig.cssls.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure gopls server
    lspconfig.gopls.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure spectral server
    lspconfig.spectral.setup({
      filetypes = { "yaml" },
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure ansiblels server
    lspconfig.ansiblels.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure dockerls server
    lspconfig.dockerls.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure docker_compose_ls server
    lspconfig.docker_compose_language_service.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure phpactor server
    lspconfig.phpactor.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure jsonls server
    lspconfig.jsonls.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })

    -- configure tsserver server
    lspconfig.tsserver.setup({
      capabilities = cmp_nvim_lsp.default_capabilities(),
      on_attach = on_attach
    })
  end,
}
