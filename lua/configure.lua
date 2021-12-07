local configure = {
  vim = {
    o = {
      filetype = 'on',
      fileencodings = 'ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1',
      updatetime = 200,
      undofile = true,
      backspace = 'indent,eol,start',
      writebackup = false,
      swapfile = false,
      wrap = false,
      autochdir = true,
      autoindent = true,
      number = true,
      expandtab = true,
      tabstop = 2,
      shiftwidth = 2,
      softtabstop = 2,
      colorcolumn = '80',
      sidescrolloff = 15,
      sidescroll = 1,
      showmatch = true,
      foldlevelstart = 99,
      signcolumn = 'yes',
      hidden = true,  -- make buffer management can hide buffer without save.
    },
    g = {
      scrollfix = 50,
      loaded_matchit = 1,  -- disable matchit becasue ampping troubles.
    },
    colorscheme = 'vscode',
  },
  workspace = require('utils/path').root_pattern({{".root"}, {"compile_commands.json", "compile_flags.txt"}, {".git"}}),
}

for k, v in pairs(configure.vim.o) do
  vim.o[k] = v
end

for k, v in pairs(configure.vim.g) do
  vim.g[k] = v
end

require('colorscheme').set(configure.vim.colorscheme)

return configure
