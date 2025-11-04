return {
	{
		"b0o/SchemaStore.nvim",
		ft = { "yaml", "yaml.docker-compose" },
		lazy = true,
	},

	{
		'cenk1cenk2/schema-companion.nvim',
		ft = { "yaml", "yaml.docker-compose" },
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope.nvim' },
		},
		config = function()
			require('schema-companion').setup({
				enable_telescope = true,
				matchers = {
					require('schema-companion.matchers.kubernetes').setup({ version = 'master' }),
				},
				schemas = {
					{
						name = 'Kubernetes v1.30',
						uri =
						'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.3-standalone-strict/all.json',
					},
				},
			})
		end,
	},
}
