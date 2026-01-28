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

-- Statusline minimalista apenas para Java
local default_progress = vim.lsp.handlers["$/progress"]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    -- Esconde progresso do jdtls
    vim.lsp.handlers["$/progress"] = function(err, result, ctx, config)
      if ctx.client_id then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if client and client.name == "jdtls" then
          return
        end
      end
      return default_progress(err, result, ctx, config)
    end

    -- Statusline minimalista para Java
    vim.opt_local.statusline = table.concat({
      " %f", -- arquivo
      "%m", -- modificado
      "%=", -- separador
      "%{luaeval('vim.bo.filetype')}",
      "  %l:%c ", -- linha:coluna
    })
  end,
})

-- Restaura comportamento normal ao sair de Java
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*.java",
  callback = function()
    vim.lsp.handlers["$/progress"] = default_progress
    vim.opt_local.statusline = ""
  end,
})
