return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "dockerfile",
        "go",
        "lua",
        "python",
      },
      ignore_install = {},
      modules = {},
      sync_install = false,

      auto_install = true,
      indent = {
        enable = true,
      },

      highlight = {
        enable = true,
        disable = { "gitcommit" },
        additional_vim_regex_highlighting = { "markdown" },
      },
    })
  end,
}
