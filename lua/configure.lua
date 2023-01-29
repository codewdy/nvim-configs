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
      scrolloff = 9999,
      sidescrolloff = 15,
      sidescroll = 1,
      showmatch = true,
      foldlevelstart = 99,
      signcolumn = 'yes',
      hidden = true,  -- make buffer management can hide buffer without save.
      cursorline = true,
      clipboard = "unnamedplus",
      mouse = false,
    },
    g = {
      loaded_matchit = 1,  -- disable matchit becasue ampping troubles.
    },
    colorscheme = 'vscode',
  },
  filetype = {
    cpp = {
      bo = {
        tabstop = 2,
        shiftwidth = 2,
        softtabstop = 2,
      },
      wo = {
        foldmethod='expr',
        foldexpr='nvim_treesitter#foldexpr()',
      }
    },
    c = 'cpp',
    h = 'cpp',
    hpp = 'cpp',
    python = {
      bo = {
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
      },
      wo = {
        foldmethod='expr',
        foldexpr='nvim_treesitter#foldexpr()',
      }
    },
    default = {
      bo = {
        tabstop = 2,
        shiftwidth = 2,
        softtabstop = 2,
      },
      wo = {
        foldmethod='indent',
      }
    }
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

udf.configure = udf.configure or {}

function udf.configure.flush_filetype()
  filetype = vim.bo.filetype
  while type(configure.filetype[filetype]) == 'string' do
    filetype = configure.filetype[filetype]
  end
  if configure.filetype[filetype] == nil then
    filetype = 'default'
  end

  for k, v in pairs(configure.filetype[filetype].bo or {}) do
    vim.bo[k] = v
  end

  for k, v in pairs(configure.filetype[filetype].wo or {}) do
    vim.wo[k] = v
  end
end

vim.cmd("au filetype * lua udf.configure.flush_filetype()")

return configure
