return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
    -- config = function(_, opts)
    --   require("catppuccin").setup(opts)
    -- end,
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon",
      dark_variant = "moon",
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
    end,
  },
}
