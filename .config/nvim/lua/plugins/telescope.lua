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
    'nvim-telescope/telescope-ui-select.nvim'
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
        mappings = {
          n = {
            ["<leader>a"] = function(prompt_bufnr)
              local actions = require('telescope.actions')
              local action_state = require('telescope.actions.state')
              local harpoon = require('harpoon')

              local picker = action_state.get_current_picker(prompt_bufnr)
              local multi_selection = picker:get_multi_selection()

              if #multi_selection <= 1 then
                return
              end

              for _, entry in ipairs(multi_selection) do
                harpoon:list():add({
                  value = entry.filename,
                  context = {
                    col = 0,
                    row = 1
                  }
                })
              end

              actions.close(prompt_bufnr)
            end
          }
        }
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
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
  end
}
