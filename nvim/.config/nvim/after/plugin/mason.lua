local mason = require('mason')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason_tool_installer.setup({
  ensure_installed = {
    "prettier",       -- prettier formatter
    "htmlbeautifier", -- prettier formatter
    "stylua",         -- lua formatter
    "isort",          -- python formatter
    "black",          -- python formatter
  },
})

local servers = {
  ruby_lsp = {
    filetypes = { 'ruby', 'eruby' },
  },
  lua_ls = {
    -- make the language server recognize "vim" global
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
    }
  },
  rubocop = {},
}

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})



mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}
--  To check the current status of installed tools and/or manually install
--  other tools, you can run
--    :Mason
--
--  You can press `g?` for help in this menu.

-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.

-- local mason = require('mason')
-- local lspconfig = require("lspconfig")
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
-- local mason_lspconfig = require('mason-lspconfig')
-- local mason_tool_installer = require('mason-tool-installer')
--
-- local capabilities = cmp_nvim_lsp.default_capabilities()
-- -- eable debuging
-- -- vim.lsp.set_log_level("debug")
-- -- enable mason and configure icons
-- mason.setup({
--   ui = {
--     icons = {
--       package_installed = "✓",
--       package_pending = "➜",
--       package_uninstalled = "✗",
--     },
--   },
-- })
--
-- mason_tool_installer.setup({
--   ensure_installed = {
--     "prettier",       -- prettier formatter
--     "htmlbeautifier", -- prettier formatter
--     "stylua",         -- lua formatter
--     "isort",          -- python formatter
--     "black",          -- python formatter
--   },
-- })
--
-- mason_lspconfig.setup({
--   -- list of servers for mason to install
--   ensure_installed = { 'ruby_lsp',
--     'lua_ls',
--     'html',
--     'cssls' },
-- })
--
-- mason_lspconfig.setup_handlers({
--   -- default handler for installed servers
--   function(server_name)
--     lspconfig[server_name].setup({
--       capabilities = capabilities,
--     })
--   end,
--   ["lua_ls"] = function()
--     -- configure lua server (with special settings)
--     lspconfig["lua_ls"].setup({
--       capabilities = capabilities,
--       settings = {
--         Lua = {
--           -- make the language server recognize "vim" global
--           diagnostics = {
--             globals = { "vim" },
--           },
--           completion = {
--             callSnippet = "Replace",
--           },
--         },
--       },
--     })
--   end,
--   ["ruby_lsp"] = function()
--     lspconfig["ruby_lsp"].setup({
--       capabilities = capabilities,
--       settings = {
--         ruby_lsp = {}
--       },
--       filetypes = {
--         "ruby",
--         "eruby"
--       },
--     })
--   end,
-- })
