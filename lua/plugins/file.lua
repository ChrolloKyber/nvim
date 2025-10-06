return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          "permission",
          "size",
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            return name == ".git" or name == ".."
          end,
          sort = {
            { "type", "asc" },
            { "name", "asc" },
          },
        },
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Launch Oil" })
    end,
  },
}
