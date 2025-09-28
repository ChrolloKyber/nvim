vim.g.auto_reload = false
local opt = vim.opt
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
opt.title = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.swapfile = false
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.breakindent = true
opt.autoindent = true
opt.termguicolors = true
opt.wrap = false
opt.backup = false
opt.undofile = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.cmdheight = 1
opt.inccommand = "split"
opt.signcolumn = "yes"
opt.foldcolumn = "auto:1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", extends = "›", precedes = "‹", eol = "↲" }
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.showbreak = "↪"
opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
