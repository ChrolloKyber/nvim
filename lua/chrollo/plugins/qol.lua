return {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
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
    dependencies = { "nvim-tree/nvim-web-devicons", "ChrolloKyber/yaml-companion.nvim" },
    config = function()
      local function get_schema()
        local schema = require("yaml-companion").get_buf_schema(0)
        if schema.result[1].name == "none" then
          return ""
        end
        return schema.result[1].name
      end
      local custom_gruvbox = require("lualine.themes.gruvbox-material")
      custom_gruvbox.normal.a.bg = "#32302f"
      custom_gruvbox.normal.a.fg = "#ddc7a1"
      custom_gruvbox.normal.c.bg = "#3c3836"
      custom_gruvbox.insert.a.bg = "#7daea3"
      require("lualine").setup({
        options = {
          theme = custom_gruvbox,
        },
        sections = {
          lualine_b = { "branch", "diff" },
          lualine_c = {},
          lualine_x = { "filename" },
          lualine_y = { get_schema },
          lualine_z = { { "filetype", colored = false } },
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
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disable_mouse = false,
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
}
