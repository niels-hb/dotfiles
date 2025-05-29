return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
    },
  },
}
