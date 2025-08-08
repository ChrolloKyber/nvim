return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
    tag = "0.1.8",
    config = function()
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local layout = require("telescope.actions.layout")
      require("telescope").setup({
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
          },
        },
        defaults = {
          file_ignore_patterns = { ".git/" },
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "top",
            vertical = {
              prompt_position = "top",
              preview_cutoff = 0,
            },
          },
          mappings = {
            i = {
              ["<esc>"] = builtin.close,
              ["<C-x>"] = actions.delete_buffer + actions.move_to_top,
              ["<C-p>"] = layout.toggle_preview,
            },
            n = {
              ["<C-p>"] = layout.toggle_preview,
            },
          },
        },
      })
      require("telescope").load_extension("fzy_native")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope buffers" })
    end,
  },
}
