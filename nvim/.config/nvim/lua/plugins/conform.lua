return {
  "stevearc/conform.nvim",
  --  for users those who want auto-save conform + lazyloading!
  -- event = "BufWritePre"
  opts = {
    formatters_by_ft = {
      php = { "php_cs_fixer" },
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      css = { "prettier" },
      html = { "prettier" },
      markdown = { "markdownlint" },
    },
  },
}
