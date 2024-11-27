return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'buffers' }
    }
  }
}
