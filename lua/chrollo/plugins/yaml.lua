return {
  "b0o/SchemaStore.nvim",
  dependencies = {
    "ChrolloKyber/yaml-companion.nvim",
    "neovim/nvim-lspconfig",
    "redhat-developer/yaml-language-server",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("yaml_schema")
    local cfg = require("yaml-companion").setup({
      builtin_matchers = {
        kubernetes = { enabled = true },
        cloud_init = { enabled = true },
      },
      schemas = {
        {
          name = "Kubernetes 1.33.1",
          uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.33.1-standalone-strict/all.json",
        },
      },
      lspconfig = {
        flags = {
          debounce_text_changes = 150,
        },
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            validate = true,
            completion = true,
            format = {
              enable = true,
              singleQuote = false,
              bracketSpacing = true,
            },
            hover = true,
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = {
              kubernetes = { "k8s**.yaml", "k8s**.yml", "kube**.yaml", "kube**.yml" },
            },
            schemaDownload = { enable = true },
            trace = { server = "debug" },
          },
        },
      },
    })
    local lspconfig = require("lspconfig")
    lspconfig.yamlls.setup(cfg)
  end,
}
