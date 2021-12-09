local pkg = require('pkg')
pkg.req({'codewdy/clangd-helper.nvim'})
pkg.req({'neovim/nvim-lspconfig', config=[[require("lsp/nvim-lspconfig")]]})
pkg.req({'ray-x/lsp_signature.nvim', config=[[require("lsp/lsp_signature")]]})
