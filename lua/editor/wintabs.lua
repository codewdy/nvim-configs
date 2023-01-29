vim.g.wintabs_autoclose_vim = true
vim.g.wintabs_autoclose = 1

if udf.wintabs_cabbrev == nil then
  udf.wintabs_cabbrev = {}
end

udf = udf or {}

function udf.wintabs_cabbrev.wq()
  vim.cmd('w')
  vim.cmd('WintabsClose')
end

vim.cmd([[cabbrev wq <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'lua udf.wintabs_cabbrev.wq()' : 'wq')<CR>]])
vim.cmd([[cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'WintabsClose' : 'q')<CR>]])
vim.cmd([[cabbrev q! <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'WintabsClose' : 'q!')<CR>]])

function udf.wintab_close()
  if vim.fn.bufname() ~= "" then
    vim.api.nvim_command("WintabsClose")
  end
end
