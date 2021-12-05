local pkg = require('pkg')

pkg.req({'rhysd/accelerated-jk', config = [[require('editor/accelerated-jk')]]})

pkg.req({'phaazon/hop.nvim', branch='v1', config = [[require('editor/hop')]]})

pkg.req({'kyazdani42/nvim-web-devicons'})
pkg.req({'hoob3rt/lualine.nvim', config = [[require('editor/lualine')]]})

pkg.req({'terrortylor/nvim-comment', config = [[require('editor/nvim-comment')]]})

pkg.req({'zefei/vim-wintabs', config = [[require('editor/wintabs')]]})
pkg.req({'zefei/vim-wintabs-powerline'})

pkg.req({'nvim-treesitter/nvim-treesitter', config = [[require('editor/nvim-treesitter')]]})
pkg.req({'romgrk/nvim-treesitter-context', config = [[require('editor/nvim-treesitter-context')]]})
pkg.req({'codewdy/nvim_context_vt', config = [[require('editor/nvim_context_vt')]]})
pkg.req({'codewdy/universal-tags.nvim'})
pkg.req({'p00f/nvim-ts-rainbow'})
pkg.req({'nvim-treesitter/playground'})

pkg.req({'lukas-reineke/indent-blankline.nvim', config = [[require('editor/indent-blankline')]]})

pkg.req('nvim-lua/plenary.nvim')
pkg.req({'nvim-telescope/telescope.nvim', config = [[require('editor/telescope')]]})

pkg.req({'voldikss/vim-floaterm', config = [[require('editor/floaterm')]]})

pkg.req({'vim-scripts/scrollfix'})

pkg.req({'codewdy/source-header-switcher.nvim', config = [[require('editor/source-header-switcher')]]})