return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "float", -- AQUI deixa flutuante igual AstroNvim
    float_opts = {
      border = "rounded",
      winblend = 0,
    },
  },
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Terminal flutuante" },

    {
      "<leader>ot",
      "<cmd>ToggleTerm<cr>",
      desc = "Terminal flutuante",
    },
  },
}
