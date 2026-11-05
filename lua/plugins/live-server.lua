return {
  -- Voltamos para o GitHub estável e rápido para evitar timeouts
  "barrettruth/live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
  init = function()
    -- Definir isso antes do load faz o erro sumir
    vim.g.live_server = {}

    -- Truque de mestre: desativa o aviso chato de migração para o Forgejo
    -- (v0.2.0 introduziu essa global interna para silenciar o warning)
    vim.g.live_server_suppress_migration_warning = true
  end,
}
