local set = vim.api.nvim_set_hl

-- fundo
set(0, "NeoTreeNormal", { bg = "#1e1e1e", fg = "#d4d4d4" })
set(0, "NeoTreeNormalNC", { bg = "#1e1e1e", fg = "#9e9e9e" })
set(0, "NeoTreeEndOfBuffer", { bg = "#1e1e1e", fg = "#1e1e1e" })

-- pastas
set(0, "NeoTreeDirectoryName", { fg = "#c8c8c8" })
set(0, "NeoTreeDirectoryIcon", { fg = "#c5c5c5" })

-- arquivos
set(0, "NeoTreeFileName", { fg = "#d4d4d4" })
set(0, "NeoTreeFileNameOpened", { fg = "#ffffff", bold = true })

-- seleção
set(0, "NeoTreeCursorLine", { bg = "#2a2d2e" })

-- git
set(0, "NeoTreeGitAdded", { fg = "#6a9955" })
set(0, "NeoTreeGitModified", { fg = "#c5862b" })
set(0, "NeoTreeGitDeleted", { fg = "#f44747" })
