return {
	"b0o/SchemaStore.nvim",
	dependencies = {
		{
			"ChrolloKyber/yaml-companion.nvim",
			ft = { "yaml", "yaml.docker-compose" },
		},
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	ft = { "yaml", "yaml.docker-compose" },
	config = function()
		require("telescope").load_extension("yaml_schema")
		vim.lsp.config("yamlls", {
			settings = {
				yaml = { SchemaStore = { enable = true } },
				schemas = require("schemastore").yaml.schemas(),
			},
		})
	end,
}
