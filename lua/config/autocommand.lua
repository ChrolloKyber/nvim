local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tf",
  callback = function()
    vim.bo.filetype = "terraform"
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tpl",
  callback = function()
    vim.bo.filetype = "json"
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "jenkinsfile*", "Jenkinsfile*" },
  callback = function()
    vim.bo.filetype = "groovy"
    vim.opt.shiftwidth = 4
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Caddyfile",
  callback = function()
    vim.bo.filetype = "caddy"
  end
})
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".gitconfig*",
  callback = function()
    vim.bo.filetype = "gitconfig"
  end,
})

-- Save cursor position while yanking
local cursorPreYank
local map = vim.keymap.set

map({ "n", "x" }, "y", function()
  cursorPreYank = vim.api.nvim_win_get_cursor(0)
  return "y"
end, { expr = true })

map("n", "Y", function()
  cursorPreYank = vim.api.nvim_win_get_cursor(0)
  return "y$"
end, { expr = true })

autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
    if vim.v.event.operator == "y" and cursorPreYank then
      vim.api.nvim_win_set_cursor(0, cursorPreYank)
    end
  end,
})

autocmd("VimEnter", {
  callback = function()
    require("lazy").update({ show = false })
  end,
})
-- Restore cursor position
autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("term-open", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.rnu = false
  end,
})
