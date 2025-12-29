return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "LazyFile",
  opts = function()
    return {
      indent = {
        char = "│",
        highlight = "IblIndent",
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = {
          "dashboard",
          "neo-tree",
          "snacks_dashboard",
          "snacks_terminal",
          "snacks_win",
          "help",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "trouble",
        },
      },
    }
  end,
}
