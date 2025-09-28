return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients()
      for _, ls in ipairs(language_servers) do
        vim.lsp.config[ls]({
          capabilities = capabilities,
        })
      end
      local map = vim.keymap.set
      require("ufo").setup({
        preview = {
          win_config = {
            border = { "", "─", "", "", "", "─", "", "" },
            winhighlight = "Normal:Folded",
            winblend = 0,
          },
        },
        map("n", "zR", require("ufo").openAllFolds, { desc = "UFO: Open all folds" }),
        map("n", "zM", require("ufo").closeAllFolds, { desc = "UFO: Close all folds" }),
        map("n", "zK", require("ufo").peekFoldedLinesUnderCursor, { desc = "UFO: preview fold" }),
      })
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        setopt = true,
        segments = {
          {
            text = { builtin.foldfunc, " " },
            click = "v:lua.ScFa",
          },
          {
            sign = { namespace = { "gitsign" }, colwidth = 1, wrap = false },
            click = "v:lua.ScSa",
          },
          {
            text = { builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
        },
      })
    end,
  },
}
