local custom_layout_config = {
  anchor = "N",
  prompt_position = "bottom",
  height = 0.25,
  width = 0.5,
}

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('telescope').setup({
      extensions = {
        ['ui-select'] = {
          layout_strategy = "vertical",
          layout_config = custom_layout_config
        }
      },
      defaults = {
        preview = false,
        file_ignore_patterns = {
          "%.git/",
          "node_modules/"
        },
        layout_strategy = "vertical",
        layout_config = custom_layout_config,
      },
      pickers = {
        find_files = {
          hidden = true
        },
        live_grep = {
          preview = true,
          layout_config = {
            height = 0.5,
          }
        }
      }
    })

    require('telescope').load_extension('ui-select')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
