-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Desativa netrw (causa do explorer fantasma ao usar nvim .)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NÃO mostrar caracteres invisíveis por padrão
vim.opt.list = false
vim.opt.listchars = {}

-- LazyVim reativa 'list' depois do startup, então forçamos desligar novamente
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.opt.list = false
    vim.opt.listchars = {}
  end,
})

vim.opt.relativenumber = false
vim.opt.number = true
