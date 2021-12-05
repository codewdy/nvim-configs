local status, universal_tags = pcall(require, 'universal-tags')
local lualine_universal_tags
if universal_tags then
  lualine_universal_tags = {
    universal_tags.cached_where_am_i_str,
    cond = universal_tags.supportted
  }
else
  lualine_universal_tags = nil
end

local function remove_nil(tbl)
  ret = {}
  for _,v in ipairs(tbl) do
    if v ~= nil then
      table.insert(ret, v)
    end
  end
  return ret
end

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'diagnostics',
        sources = {'nvim_lsp', 'coc'}
      }
    },
    lualine_c = remove_nil({
      lualine_universal_tags
		}),
    lualine_x = {},
    lualine_y = {
      {
        'filename',
        file_status = true,
        path = 2,
        shorting_target = 40
      }
    },
    lualine_z = {
      {
        function ()
          return os.date("%H:%M")
        end
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

