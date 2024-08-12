-- Enable relative line number
vim.opt.nu = true
vim.opt.rnu = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2

-- Enable break indenting
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable text wrap
vim.opt.wrap = false

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enale mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase and smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set completeopt to have better comletion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8
