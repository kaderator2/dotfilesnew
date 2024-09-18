vim.g.mapleader = " "
require("lazy-config")
require("chade.remap")
require("chade.set")
require("mason").setup()
require("Comment").setup()
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
