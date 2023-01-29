local lspconfig = require('lspconfig')
local util = require 'lspconfig/util'
local clangd_background_loader = require('clangd-helper/clangd-background-loader')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.clangd.setup{
  root_dir = require('configure').workspace,
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach()
    clangd_background_loader.on_attach(client, bufnr)
    require 'illuminate'.on_attach(client)
  end,
  capabilities = capabilities,
  -- cmd = { 'clangd', '--background-index', '--limit-results=0' },
}
lspconfig.sumneko_lua.setup{
  root_dir = require('configure').workspace,
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach()
    require 'illuminate'.on_attach(client)
  end,
  capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = clangd_background_loader.on_publish_diagnostics_wapper(
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    signs = true,
    update_in_insert = true,
    virtual_text = {
        true,
        spacing = 6,
    },
  }
))
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single",
    focusable = false,
    close_events = {"CursorMoved", "CursorMovedI", "BufHidden", "BufLeave", "InsertCharPre"},
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "single",
    focusable = false,
    close_events = {"CursorMoved", "CursorMovedI", "BufHidden", "BufLeave", "InsertCharPre"},
  }
)

if udf.lsp == nil then
  udf.lsp = {}
end

function udf.lsp.hover()
  vim.lsp.buf.hover()
end

function udf.lsp.show_line_diagnostics()
  vim.lsp.diagnostic.show_line_diagnostics({
    focusable = false,
    close_events = {"CursorMoved", "CursorMovedI", "BufHidden", "BufLeave", "InsertCharPre"},
  })
end

function udf.lsp.goto_next_diagnostics()
  vim.lsp.diagnostic.goto_next({
    popup_opts = {
      focusable = false,
      close_events = {"CursorMoved", "CursorMovedI", "BufHidden", "BufLeave", "InsertCharPre"},
    }
  })
end

function udf.lsp.goto_prev_diagnostics()
  vim.lsp.diagnostic.goto_prev({
    popup_opts = {
      focusable = false,
      close_events = {"CursorMoved", "CursorMovedI", "BufHidden", "BufLeave", "InsertCharPre"},
    }
  })
end

function udf.lsp.rename()
  vim.lsp.buf.rename()
end

vim.api.nvim_command [[ sign define LspDiagnosticsSignError         text=✗ texthl=LspDiagnosticsSignError       linehl= numhl= ]]
vim.api.nvim_command [[ sign define LspDiagnosticsSignWarning       text=⚠ texthl=LspDiagnosticsSignWarning     linehl= numhl= ]]
vim.api.nvim_command [[ sign define LspDiagnosticsSignInformation   text= texthl=LspDiagnosticsSignInformation linehl= numhl= ]]
vim.api.nvim_command [[ sign define LspDiagnosticsSignHint          text= texthl=LspDiagnosticsSignHint        linehl= numhl= ]]

vim.api.nvim_command [[ autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR> ]]
