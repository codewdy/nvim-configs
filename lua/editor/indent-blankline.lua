vim.opt.list = true

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  context_patterns = {
    "class", "function", "method", "struct", "compound_statement",
    "initializer_list"
  },
  buftype_exclude = {'terminal'}
}
