return require('schema-companion').setup_client({
	settings = {
		yaml = {
			hover = true,
			completion = true,
			schemaStore = {
				enable = true,
			},
		},
	},
})
