-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/wdy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/wdy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/wdy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/wdy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/wdy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["accelerated-jk"] = {
    config = { "require('editor/accelerated-jk')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/accelerated-jk",
    url = "https://github.com/rhysd/accelerated-jk"
  },
  ["clangd-helper.nvim"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/clangd-helper.nvim",
    url = "https://github.com/codewdy/clangd-helper.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["hop.nvim"] = {
    config = { "require('editor/hop')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('editor/indent-blankline')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('editor/lualine')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["nvim-cmp"] = {
    config = { "require('complete/nvim-cmp')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "require('editor/nvim-comment')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("lsp/nvim-lspconfig")' },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "require('editor/nvim-treesitter')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "require('editor/nvim-treesitter-context')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvim_context_vt = {
    config = { "require('editor/nvim_context_vt')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/codewdy/nvim_context_vt"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  scrollfix = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/scrollfix",
    url = "https://github.com/vim-scripts/scrollfix"
  },
  ["source-header-switcher.nvim"] = {
    config = { "require('editor/source-header-switcher')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/source-header-switcher.nvim",
    url = "https://github.com/codewdy/source-header-switcher.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('editor/telescope')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["universal-tags.nvim"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/universal-tags.nvim",
    url = "https://github.com/codewdy/universal-tags.nvim"
  },
  ["vim-floaterm"] = {
    config = { "require('editor/floaterm')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-wintabs"] = {
    config = { "require('editor/wintabs')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/vim-wintabs",
    url = "https://github.com/zefei/vim-wintabs"
  },
  ["vim-wintabs-powerline"] = {
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/vim-wintabs-powerline",
    url = "https://github.com/zefei/vim-wintabs-powerline"
  },
  ["vscode.nvim"] = {
    config = { "require('colorscheme.vscode')" },
    loaded = true,
    path = "/home/wdy/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('editor/telescope')
time([[Config for telescope.nvim]], false)
-- Config for: source-header-switcher.nvim
time([[Config for source-header-switcher.nvim]], true)
require('editor/source-header-switcher')
time([[Config for source-header-switcher.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
require('editor/nvim-comment')
time([[Config for nvim-comment]], false)
-- Config for: nvim_context_vt
time([[Config for nvim_context_vt]], true)
require('editor/nvim_context_vt')
time([[Config for nvim_context_vt]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
require('editor/floaterm')
time([[Config for vim-floaterm]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('complete/nvim-cmp')
time([[Config for nvim-cmp]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
require('colorscheme.vscode')
time([[Config for vscode.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
require('editor/hop')
time([[Config for hop.nvim]], false)
-- Config for: vim-wintabs
time([[Config for vim-wintabs]], true)
require('editor/wintabs')
time([[Config for vim-wintabs]], false)
-- Config for: accelerated-jk
time([[Config for accelerated-jk]], true)
require('editor/accelerated-jk')
time([[Config for accelerated-jk]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('editor/lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("lsp/nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('editor/nvim-treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('editor/indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
require('editor/nvim-treesitter-context')
time([[Config for nvim-treesitter-context]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
