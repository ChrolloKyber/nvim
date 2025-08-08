return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()
    harpoon:extend(require("harpoon.extensions").builtins.command_on_nav("UfoEnableFold"))

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { silent = true, desc = "Tag files to Harpoon" })
    vim.keymap.set("n", "<leader>hi", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = "Harpoon Open Quick Menu" })
    vim.keymap.set("n", "<C-1>", function()
      harpoon:list():select(1)
    end, { silent = true, desc = "Harpoon Goto File 1" })
    vim.keymap.set("n", "<C-2>", function()
      harpoon:list():select(2)
    end, { silent = true, desc = "Harpoon Goto File 2" })
    vim.keymap.set("n", "<C-3>", function()
      harpoon:list():select(3)
    end, { silent = true, desc = "Harpoon Goto File 3" })
    vim.keymap.set("n", "<C-4>", function()
      harpoon:list():select(4)
    end, { silent = true, desc = "Harpoon Goto File 4" })
    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():prev()
    end, { silent = true, desc = "Harpoon Previous File" })
    vim.keymap.set("n", "<C-e>", function()
      harpoon:list():next()
    end, { silent = true, desc = "Harpoon Next File" })
  end,
}
