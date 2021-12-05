local pkg = require('pkg')

pkg.req({'hrsh7th/nvim-cmp',
        requires = {'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp'},
        config = [[require('complete/nvim-cmp')]]})
pkg.req({"hrsh7th/cmp-buffer"})
pkg.req({"hrsh7th/cmp-nvim-lsp"})
