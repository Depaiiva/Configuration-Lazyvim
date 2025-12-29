return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = function(_, opts)
    opts.close_if_last_window = true
    opts.enable_git_status = true
    opts.enable_diagnostics = false

    opts.filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    }

    opts.window = {
      width = 32,
      mappings = {
        ["<space>"] = "none",
      },
    }
    return opts
  end,
}
