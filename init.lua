udf = {}

local pkg = require('pkg')

require('lsp')
require('editor')
require('complete')

require('mapping')
require('configure')

return pkg.startup()
