vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "min-theme-dark",
  callback = function()
    local map = {
      ["@lsp.type.modifier.java"] = "@keyword.modifier.java",
      ["@lsp.type.keyword.java"] = "@keyword.java",
      ["@lsp.type.class.java"] = "@type.java",
      ["@lsp.type.interface.java"] = "@type.java",
      ["@lsp.type.method.java"] = "@function.method.java",
      ["@lsp.type.function.java"] = "@function.java",
      ["@lsp.type.variable.java"] = "@variable.java",
      ["@lsp.type.parameter.java"] = "@variable.parameter.java",
    }

    for lsp, ts in pairs(map) do
      vim.api.nvim_set_hl(0, lsp, { link = ts })
    end
  end,
})
