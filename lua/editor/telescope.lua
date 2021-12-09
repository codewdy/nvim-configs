local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "center",
    layout_config = {
      preview_cutoff = 1,
      width = 0.8,
      height = 20
    },
    border = true,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    dynamic_preview_title = true,
    default_mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["<C-q>"] = actions.close,
        ["<Esc>"] = actions.close,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<CR>"] = actions.select_default,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        -- TODO: This would be weird if we switch the ordering.
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    }
  },
  pickers = {
    live_grep = {
      path_display = {
        shorten = 2
      }
    }
  },
  extensions = {
    universal_tags = {
    },
    clangd_helper = {
    }
  },
}

require('telescope').load_extension('universal_tags')
require('telescope').load_extension('clangd_helper')

local themes = require('telescope.themes')

local telescope_builtin = require('telescope.builtin')

local telescope_extensions = require('telescope').extensions

local configure = require('configure')

if udf.finder == nil then
  udf.finder = {}
end

function udf.finder.file()
  local workspace = configure.workspace('.')
  telescope_builtin.find_files{
    search_dirs={workspace}, cwd=workspace
  }
end

function udf.finder.grep()
  local workspace = configure.workspace('.')
  telescope_builtin.live_grep{
    search_dirs={workspace}, cwd=workspace
  }
end

function udf.finder.universal_tags()
  telescope_extensions.universal_tags.universal_tags{}
end

function udf.finder.lsp_symbols()
  telescope_extensions.clangd_helper.clangd_helper{}
end

function udf.finder.fuzzy_find()
  telescope_builtin.current_buffer_fuzzy_find{}
end

if udf.lsp == nil then
  udf.lsp = {}
end

function udf.lsp.definition()
  telescope_builtin.lsp_definitions{
  }
end

function udf.lsp.reference()
  telescope_builtin.lsp_references{
  }
end
