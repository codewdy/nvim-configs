local pkg = {}

local packs = {}

function pkg.req(x)
  table.insert(packs, x)
end

function pkg.startup()
  return require('packer').startup({function()
    for id,val in ipairs(packs) do
      use(val)
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
end

pkg.req('wbthomason/packer.nvim')

return pkg
