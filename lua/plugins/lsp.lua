return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"Saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config('terraformls', {
				cmd = { "terraform-ls", "serve", "-log-file", "/dev/null" },
				capabilities = capabilities,
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("terraformls")

			vim.diagnostic.config({
				severity_sort = true,
				virtual_lines = true,
				float = { border = "rounded", source = "if_many" },
				underline = true,
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp", {}),
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					if client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end
					if
						not client:supports_method("textDocument/willSaveWaitUntil")
						and client:supports_method("textDocument/formatting")
					then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("lsp", { clear = false }),
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"Saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },
			appearance = {
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						score_offset = 100,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 90,
					},
				},
			},
			completion = {
				menu = {
					auto_show = true,
					draw = {
						columns = {
							{ "label",     "label_description", gap = 1 },
							{ "kind_icon", gap = 1,             "kind" },
						},
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				accept = { auto_brackets = { enabled = true } },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},
			signature = {
				enabled = true,
				trigger = {
					enabled = true,
					show_on_keyword = true,
				}
			},
		},
		opts_extend = { "sources.default" },
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			automatic_enable = true,
		},
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },

		opts = {
			notify_on_error = true,
			formatters_by_ft = {
				json = { "prettier" },
				markdown = { "prettier" },
				sh = { "shfmt" },
			},
		},
	},
}
