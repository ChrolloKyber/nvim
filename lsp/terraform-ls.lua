return {
  cmd = { "terraform-ls", "serve", "-log-file", "/dev/null" },
  on_init = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}
