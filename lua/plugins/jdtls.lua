return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local jdtls = require("jdtls")
    local jdtls_setup = require("jdtls.setup")

    local lombok_path = vim.fn.expand("~/.local/share/java/lombok.jar")

    -- 🔍 Detecta raiz do projeto
    local root_markers = { ".git", "pom.xml", "mvnw", "gradlew" }
    local root_dir = jdtls_setup.find_root(root_markers)

    if not root_dir then
      return
    end

    -- 📦 Workspace por projeto
    local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
    local workspace_dir = vim.fn.expand("~/.cache/jdtls/workspace/") .. project_name

    -- 📦 Bundles (APENAS Java debug/test, sem configurar DAP manualmente)
    local mason_path = vim.fn.stdpath("data") .. "/mason/"
    local bundles = {}

    local debug_jars = vim.fn.glob(
      mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
      false,
      true
    )

    local test_jars = vim.fn.glob(
      mason_path .. "packages/java-test/extension/server/*.jar",
      false,
      true
    )

    vim.list_extend(bundles, debug_jars)
    vim.list_extend(bundles, test_jars)

    local jdtls_cmd = vim.fn.stdpath("data") .. "/mason/bin/jdtls"

    -- ⚙️ Config principal
    local config = {
      cmd = {
        jdtls_cmd,
        "--jvm-arg=-javaagent:" .. lombok_path,
        "--jvm-arg=-Xms512m",
        "--jvm-arg=-Xmx2g",
        "--jvm-arg=-XX:+UseG1GC",
      },

      root_dir = root_dir,

      settings = {
        java = {
          autobuild = { enabled = false },

          completion = {
            maxResults = 20,
            guessMethodArguments = false,
          },

          configuration = {
            updateBuildConfiguration = "interactive",
          },

          maven = {
            downloadSources = true,
          },

          implementationsCodeLens = {
            enabled = true,
          },

          referencesCodeLens = {
            enabled = true,
          },

          inlayHints = {
            parameterNames = { enabled = "all" },
          },
        },
      },

      init_options = {
        bundles = bundles,
        workspace = workspace_dir,
      },

      capabilities = require("cmp_nvim_lsp").default_capabilities(),

      on_attach = function(_, bufnr)
        -- 🔥 CodeLens
        pcall(vim.lsp.codelens.refresh)

        vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
          buffer = bufnr,
          callback = function()
            pcall(vim.lsp.codelens.refresh)
          end,
        })

        local opts = { buffer = bufnr }

        -- Java utils (SEM DAP)
        vim.keymap.set("n", "<leader>di", jdtls.organize_imports, opts)
        vim.keymap.set("n", "<leader>dt", jdtls.test_class, opts)
        vim.keymap.set("n", "<leader>dn", jdtls.test_nearest_method, opts)
      end,
    }

    -- 🚀 Start ou attach
    jdtls.start_or_attach(config)

    -- 🔄 CodeLens inicial
    vim.defer_fn(function()
      pcall(vim.lsp.codelens.refresh)
    end, 100)
  end,
}
