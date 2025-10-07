return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        dim_inactive = false,
        contrast = "hard",
        overrides = {
          ["@markup.heading.1.markdown"] = { fg = "#fb4934", bg = "", bold = true },
          ["@markup.heading.2.markdown"] = { fg = "#fabd2f", bg = "", bold = true },
          ["@markup.heading.3.markdown"] = { fg = "#b8bb26", bg = "", bold = true },
          ["@markup.heading.4.markdown"] = { fg = "#8ec07c", bg = "", bold = true },
          ["@markup.heading.5.markdown"] = { fg = "#83a598", bg = "", bold = true },
          ["@markup.heading.6.markdown"] = { fg = "#d3869b", bg = "", bold = true },
          SignColumn = { bg = "" },
          FoldColumn = { bg = "" },
          FloatBorder = { link = "Normal" },
        },
      })
      -- vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    config = function()
      require("NeoSolarized").setup({
        transparent = false
      })
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme('rose-pine')
    end
  }
}
