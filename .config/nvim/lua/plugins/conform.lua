return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { "goimports", "gofmt" },
      astro = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      markdown = { "prettier" },
      ["*"] = { "trim_newlines", "trim_whitespace" }
    },
  },
}
