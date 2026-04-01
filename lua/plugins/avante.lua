return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      -- Provider principal (qual será usado por padrão)
      provider = "gemini",

      -- Configuração de todos os providers
      providers = {
        gemini = {
          -- Modelo gratuito e rápido para código
          model = "gemini-2.0-flash-exp",
          -- Sua API key (lida da variável de ambiente)
          api_key_name = "GEMINI_API_KEY",
          -- Timeout em milissegundos
          timeout = 30000,
          -- Parâmetros extras do corpo da requisição
          extra_request_body = {
            temperature = 0.1,
            max_tokens = 8192,
          },
        },
      },

      -- Comportamento
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        minimize_diff = true,
      },

      -- Interface
      windows = {
        position = "right",
        width = 35,
        sidebar_header = {
          enabled = true,
          align = "center",
        },
      },

      -- Atalhos
      mappings = {
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
        },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {},
      },
    },
  },
}
