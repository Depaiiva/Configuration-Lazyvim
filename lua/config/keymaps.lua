-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove o explorer antigo
pcall(vim.keymap.del, "n", "<leader>e")

-- Explorer com Neo-tree clássico
vim.keymap.set("n", "<leader>e", function()
  vim.cmd("Neotree toggle")
end, { desc = "Toggle Neo-tree" })
