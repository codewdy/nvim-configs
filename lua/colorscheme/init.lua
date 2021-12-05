local pkg = require('pkg')

local colorscheme = {}

local color = ''

function colorscheme.set(name)
  color = name
end

function colorscheme.try(name)
  if color == name then
    vim.cmd('colorscheme ' .. color)
  end
end

pkg.req({'Mofiqul/vscode.nvim', config = [[require('colorscheme.vscode')]]})

return colorscheme
