return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  opts = {
    flutter_path = os.getenv("HOME") .. "/flutter/bin/flutter",
    -- widget_guides = {
    --   enabled = true,
    -- },
    debugger = {
      enabled = false,
      run_via_dap = false,
    },
    dev_log = {
      enabled = true,
      open_cmd = "10sp",
    },
  },
  config = function(_, opts)
    require("flutter-tools").setup(opts)
  end,
}
