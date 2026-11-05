return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Desativa a inicialização do Ruff
        ruff = {
          enabled = false,
        },
      },
    },
  },
}
