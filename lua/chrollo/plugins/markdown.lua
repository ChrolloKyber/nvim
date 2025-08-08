return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "aws",
          path = "~/AWS SAA",
        },
        {
          name = "kannada",
          path = "~/Kannada",
        },
        {
          name = "Notes",
          path = "~/Notes",
        },
      },
      ui = {
        enable = false,
      },
    },
  },
  {
    "toppair/peek.nvim",
    ft = "markdown",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        app = "firefox",
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
}
