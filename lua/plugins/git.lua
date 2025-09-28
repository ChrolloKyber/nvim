return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },

  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
