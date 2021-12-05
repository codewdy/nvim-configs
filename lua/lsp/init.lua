local pkg = require('pkg')
pkg.req({'codewdy/clangd-helper.nvim'})
pkg.req({'neovim/nvim-lspconfig', config=[[require("lsp/nvim-lspconfig")]]})
