local function apply()
  -- Neo-tree / geral: cursor sem fundo (texto apenas)
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#6e6e6e", bg = "NONE" })

  -- indent padrão (VSCode)
  vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2a2a", nocombine = true })

  -- escopo NÃO deve acender ao mover cursor
  vim.api.nvim_set_hl(0, "IblScope", { fg = "#2a2a2a", nocombine = true })
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  callback = apply,
})
