vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

--vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.breakindentopt="shift:2"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

--vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.columns = 100
--vim.opt.colorcolumn = "80"
vim.opt.linebreak = true

vim.g.mapleader = " "
vim.opt.mouse = ""

vim.opt.showmode = false
vim.opt.ruler = false

vim.diagnostic.config({
    virtual_text = true,
    --virtual_lines = {
    --    current_line = true,
    --},
})

--vim.opt.spell = true
--vim.opt.spelllang = "en_us"
