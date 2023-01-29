local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and
          vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
             col, col):match("%s") == nil
end

local cmp = require('cmp')
cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      local lspkind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      }
      -- load lspkind icons
      vim_item.kind = string.format("%s %s",
                                    lspkind_icons[vim_item.kind],
                                    vim_item.kind)

      vim_item.menu = ({
          -- cmp_tabnine = "[TN]",
          orgmode = "[ORG]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          buffer = "[BUF]",
          path = "[PATH]",
          tmux = "[TMUX]",
          luasnip = "[SNIP]",
          spell = "[SPELL]"
      })[entry.source.name]

      return vim_item
    end
  },
  -- You can set mappings if you want
  mapping = {
    ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.core.view:get_selected_entry() then
            cmp.confirm({select = false})
        else
            fallback()
        end
    end),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-z>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end, {"i", "s"}),
  },
  -- You should specify your *installed* sources.
  sources = {
      {name = "nvim_lsp"}, {name = "buffer"}
  }
}
