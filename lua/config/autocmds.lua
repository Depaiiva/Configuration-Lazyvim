-- Mantém seu comportamento atual de abrir o Dashboard
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.v.this_session = nil
      vim.cmd("silent! %bwipeout!")
      vim.cmd("Dashboard")
    end
  end,
})

-- Remove indent-blankline do Dashboard e Neo-tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dashboard", "neo-tree" },
  callback = function()
    local ok, ibl = pcall(require, "ibl")
    if ok then
      ibl.setup_buffer(0, { enabled = false })
    end

    -- Aqui está a correção real
    vim.opt_local.list = false
    vim.opt_local.cursorline = false
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.foldcolumn = "0"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.cmd("setlocal nolist")
  end,
})
