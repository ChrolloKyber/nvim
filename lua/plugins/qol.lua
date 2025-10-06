return {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    enable = false,
    event = "InsertEnter",
    config = true,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "catgoose/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          names = false,
          RRGGBBAA = true,
          AARRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          sass = { enable = false, parsers = { "css" } },
        },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local custom_gruvbox = require("lualine.themes.gruvbox-material")
      custom_gruvbox.normal.a.bg = "#32302f"
      custom_gruvbox.normal.a.fg = "#ddc7a1"
      custom_gruvbox.normal.c.bg = "#3c3836"
      custom_gruvbox.insert.a.bg = "#7daea3"

      local function setup_lualine()
        local theme = "auto"
        if vim.g.colors_name == "gruvbox" then
          theme = custom_gruvbox
        end
        require("lualine").setup({
          options = {
            theme = theme,
          },
          sections = {
            lualine_b = { "branch", "diff" },
            lualine_c = {},
            lualine_x = { "filename" },
            lualine_y = {},
            lualine_z = { "filetype" },
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = { "filename" },
            lualine_y = {},
            lualine_z = {},
          },
        })
      end

      setup_lualine()

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          setup_lualine()
        end,
      })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "LunarVim/bigfile.nvim",
    opts = {
      filesize = 1,
    },
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      require("notify").setup({
        background_colour = "#000000",
        merge_duplicates = true,
      })
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "ya2s/nvim-cursorline",
    config = function()
      require("nvim-cursorline").setup({
        cursorline = {
          enable = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        },
      })
    end,
  },
}
