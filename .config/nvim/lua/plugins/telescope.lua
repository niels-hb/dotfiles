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
