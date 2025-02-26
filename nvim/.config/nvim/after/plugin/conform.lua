require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettierd", "prettier", stop_after_first = true },
    html = { "htmlbeautifier" },
    ruby = { "solargraph" },
    eruby = { "htmlbeautifier" },
  },

  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    local lsp_format_opt
    if disable_filetypes[vim.bo[bufnr].filetype] then
      lsp_format_opt = "never"
    else
      lsp_format_opt = "fallback"
    end
    return {
      timeout_ms = 500,
      lsp_format = lsp_format_opt,
    }
  end,

  notify_on_error = false,
})

vim.keymap.set(
  "", -- mode (empty string means all modes)
  "<leader>cc",
  function()
    require("conform").format({
      async = true,
      lsp_format = "fallback",
    })
  end,
  { desc = "[F]ormat buffer" }
)
