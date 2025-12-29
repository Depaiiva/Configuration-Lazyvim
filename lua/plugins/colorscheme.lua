return {
  "datsfilipe/min-theme.nvim",
  name = "min-theme",
  lazy = false,
  priority = 1000,
  config = function()
    require("min-theme").setup({
      theme = "dark",
    })
    vim.cmd.colorscheme("min-theme")
    require("config.indent-vscode")
  end,
}
