return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = require('telescope.themes').get_dropdown {
        preview = false,
        file_ignore_patterns = {
          "%.git/",
          "node_modules/"
        },
        layout_config = {
          anchor = "S",
          prompt_position = "bottom"
        },
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
          preview = true
        }
      }
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
  end
}
