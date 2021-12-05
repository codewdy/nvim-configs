local maps = {
  esc = '<C-c>',
  save = '<C-s>',
  navigator = {
    goto = '<Space>',
    function_next = 'J',
    function_prev = 'K',
    insert_left = '<C-h>',
    insert_right = '<C-l>',
    insert_up = '<C-k>',
    insert_down = '<C-j>',
  },
  fold = {
    open_cursor = '[',
    open_all_cursor = '{',
    close_cursor = ']',
    close_all_cursor = '}',
    open = '-',
    open_all = '_',
    close = '=',
    close_all = '+',
  },
  wintabs = {
    next = '<C-l>',
    prev = '<C-h>',
    close = '<C-q>',
    move_next = 'L',
    move_prev = 'H',
  },
  lsp = {
    hover = '<Tab>',
    definition = '<S-Tab>',
    diagnose = '?',
    diagnose_next = '<C-j>',
    diagnose_prev = '<C-k>',
    switch_source_header = '<C-a>',
  },
  finder = {
    file = '<C-o>',
    grep = '<C-p>',
    universal_tags = '<C-t>',
    lsp_symbols = '<C-g>',
    fuzzy_find = '<C-f>',
  },
  floaterm = {
    toggle = '<C-e>',
    new = '<C-n>',
    next = '<C-l>',
    prev = '<C-h>',
    normal = '<C-v>',
    kill = '<C-q>'
  },
}

local function keymap(mode, keys, val, cfg)
  if type(keys) == 'table' then
    for _, key in ipairs(keys) do
      vim.api.nvim_set_keymap(mode, key, val, cfg)
    end
  end
  if type(keys) == 'string' then
    local key = keys
    vim.api.nvim_set_keymap(mode, key, val, cfg)
  end
end

local function universal_keymap(keys, val, cfg)
  keymap('n', keys, val, cfg)
  keymap('i', keys, val, cfg)
  keymap('v', keys, val, cfg)
end

local function universal_normal_keymap(keys, val, cfg)
  keymap('n', keys, val, cfg)
  keymap('i', keys, '<Esc>' .. val, cfg)
  keymap('v', keys, '<Esc>' .. val, cfg)
end

universal_keymap(maps.esc, '<Esc>', {})
universal_normal_keymap(maps.save, ':w<CR>', { noremap = true })

local navigator = maps.navigator or {}
keymap('n', navigator.goto, ':HopWord<CR>', { noremap = true })
keymap('n', navigator.function_next, ':TSTextobjectGotoNextStart @function.outer<CR>', { noremap = true })
keymap('n', navigator.function_prev, ':TSTextobjectGotoPreviousStart @function.outer<CR>', { noremap = true })
keymap('i', navigator.insert_left, '<Left>', { })
keymap('i', navigator.insert_right, '<Right>', { })
keymap('i', navigator.insert_up, '<Up>', { })
keymap('i', navigator.insert_down, '<Down>', { })

local fold = maps.fold or {}
keymap('n', fold.open_cursor, 'zo', { })
keymap('n', fold.open_all_cursor, 'zO', { })
keymap('n', fold.close_cursor, 'zc', { })
keymap('n', fold.close_all_cursor, 'zC', { })
keymap('n', fold.open, 'zr', { })
keymap('n', fold.open_all, 'zR', { })
keymap('n', fold.close, 'zm', { })
keymap('n', fold.close_all, 'zM', { })

local wintabs = maps.wintabs or {}
universal_normal_keymap(wintabs.next, ':WintabsNext<CR>', { noremap = true })
universal_normal_keymap(wintabs.prev, ':WintabsPrevious<CR>', { noremap = true })
universal_normal_keymap(wintabs.move_next, ':WintabsMove 1<CR>', { noremap = true })
universal_normal_keymap(wintabs.move_prev, ':WintabsMove -1<CR>', { noremap = true })
universal_normal_keymap(wintabs.close, ':WintabsClose<CR>', { noremap = true })

local lsp = maps.lsp or {}
keymap('n', lsp.hover, ':lua udf.lsp.hover()<CR>', { noremap = true })
keymap('n', lsp.definition, ':lua udf.lsp.definition()<CR>', { noremap = true })
keymap('n', lsp.diagnose, ':lua udf.lsp.show_line_diagnostics()<CR>', { noremap = true })
keymap('n', lsp.diagnose_prev, ':lua udf.lsp.goto_prev_diagnostics()<CR>', { noremap = true })
keymap('n', lsp.diagnose_next, ':lua udf.lsp.goto_next_diagnostics()<CR>', { noremap = true })
universal_normal_keymap(lsp.switch_source_header, ':lua udf.switch_source_header()<CR>', { noremap = true })

local finder = maps.finder or {}
universal_normal_keymap(finder.file, ':lua udf.finder.file()<CR>', { noremap = true })
universal_normal_keymap(finder.grep, ':lua udf.finder.grep()<CR>', { noremap = true })
universal_normal_keymap(finder.universal_tags, ':lua udf.finder.universal_tags()<CR>', { noremap = true })
universal_normal_keymap(finder.lsp_symbols, ':lua udf.finder.lsp_symbols()<CR>', { noremap = true })
universal_normal_keymap(finder.fuzzy_find, ':lua udf.finder.fuzzy_find()<CR>', { noremap = true })

local floaterm = maps.floaterm or {}
universal_normal_keymap(floaterm.toggle, ':FloatermToggle<CR>', { noremap = true })
keymap('t', floaterm.toggle, '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true })
keymap('t', floaterm.new, '<C-\\><C-n>:FloatermNew<CR>', { noremap = true })
keymap('t', floaterm.prev, '<C-\\><C-n>:FloatermPrev<CR>', { noremap = true })
keymap('t', floaterm.next, '<C-\\><C-n>:FloatermNext<CR>', { noremap = true })
keymap('t', floaterm.normal, '<C-\\><C-n>', { noremap = true })
keymap('t', floaterm.kill, '<C-\\><C-n>:FloatermKill<CR>:FloatermToggle<CR>', { noremap = true })

return maps
