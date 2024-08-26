-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

if vim.g.neovide then
  vim.o.guifont = "GohuFont 14 Nerd Font:h12"
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.transparency = 0.8
  vim.g.neovide_transparency = 0.8

  vim.g.neovide_input_use_logo = 1
  -- vim.api.nvim_set_keymap("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
end
