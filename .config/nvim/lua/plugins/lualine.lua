return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        }
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'buffers' }
    }
  }
}
